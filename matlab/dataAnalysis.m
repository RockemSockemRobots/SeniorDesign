%need to add low pass filter
%need to add file read
%need to add FFT estimation / moving average
%need to add heading
%need to add mounting angle offsets
%need to add better numerical integration

%variables
fs = 18000; %Hz hardware sampling rate
fc = 24150000000; %Hz carrier freq
dcOff = 3.3/2; %dc offset of IQ data
c_vac = 299792458; %m/s speed of light in vacuum
c_air = c_vac/1.0003; %probably doesn't make a difference
%[t, I1, Q1] = perfectIQgen(1000,fs,1); %generate IQ data
[t, I1, Q1] = IQaccel(40*sin(pi/4),fs,fc,c_air); %generate IQ data
I1 = I1 - dcOff;
Q1 = Q1 - dcOff;
I2 = I1;
Q2 = Q1;

figure;
plot3(t(1:5001), I1(1:5001), Q1(1:5001)); %plot IQ data

%convert IQ to complex form
dataCplx1 = complex(I1,Q1);
absArray1 = abs(dataCplx1);
phaseArray1 = angle(dataCplx1);

%figure;
%spectrogram(dataCplx1,256,250,256,fs,'yaxis')

dataCplx2 = complex(I2,Q2);
absArray2 = abs(dataCplx2);
phaseArray2 = angle(dataCplx2);

%determine phase difference to determine forward or backward movement
phaseDiff1 = zeros(1,length(t));
phaseDiff2 = zeros(1,length(t));
for n = 2:length(t)
    phaseDiff1(n) = mod(phaseArray1(n) - phaseArray1(n-1) + 3*pi, 2*pi) - pi;
    phaseDiff2(n) = mod(phaseArray2(n) - phaseArray2(n-1) + 3*pi, 2*pi) - pi;
end
phaseDiff1(1) = phaseDiff1(2); %assume first sample is same as second (for now)
phaseDiff2(1) = phaseDiff2(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Estimations with simple phase difference estimate
%estimate doppler freqs and velocities
fdopp1_pd = zeros(1,length(t));
fdopp2_pd = zeros(1,length(t));
vx_pd = zeros(1,length(t));
vy_pd = zeros(1,length(t));
distDiffx_pd = zeros(1,length(t));
distDiffy_pd = zeros(1,length(t));
distTotx_pd = zeros(1,length(t));
distToty_pd = zeros(1,length(t));
n = 2;
[fdopp1_pd(n), fdopp2_pd(n), vx_pd(n), vy_pd(n)] = estVelocity_PD(2, phaseDiff1, phaseDiff2, fs, c_vac, fc, vx_pd, vy_pd);
vx_pd(2) = 2*vx_pd(2);
vy_pd(2) = 2*vy_pd(2);
fdopp1_pd(1) = fdopp1_pd(2);
fdopp2_pd(1) = fdopp2_pd(2);
for n = 3:length(t)
    [fdopp1_pd(n), fdopp2_pd(n), vx_pd(n), vy_pd(n)] = estVelocity_PD(n, phaseDiff1, phaseDiff2, fs, c_vac, fc, vx_pd, vy_pd);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%estimations with FFT
N = 128; %N-point FFT
fdopp1_fft = zeros(1,length(t));
fdopp2_fft = zeros(1,length(t));
vx_fft = zeros(1,length(t));
vy_fft = zeros(1,length(t));
distDiffx_fft = zeros(1,length(t));
distDiffy_fft = zeros(1,length(t));
distTotx_fft = zeros(1,length(t));
distToty_fft = zeros(1,length(t));

for n = N:(length(t)-mod(length(t),N))
    dft1 = fft(dataCplx1((n-(N-1)):n),N);
    [peak1,freqInd1] = max(abs(dft1));
    dft2 = fft(dataCplx2((n-(N-1)):n),N);
    [peak2,freqInd2] = max(abs(dft2));
    freqArr = 0:fs/N:fs/2;
    fdopp1_fft((n-(N-1)):n) = (fdopp1_fft((n-(N-1)):n) + freqArr(freqInd1))/2;
    fdopp2_fft((n-(N-1)):n) = (fdopp2_fft((n-(N-1)):n) + freqArr(freqInd2))/2;
    vx_fft((n-(N-1)):n) = (vx_fft((n-(N-1)):n) + ((fdopp2_fft((n-(N-1)):n)+fdopp1_fft((n-(N-1)):n))*c_vac/(2*fc)*sin(pi/4)))/2;
    vy_fft((n-(N-1)):n) = (vy_fft((n-(N-1)):n) + ((fdopp2_fft((n-(N-1)):n)-fdopp1_fft((n-(N-1)):n))*c_vac/(2*fc)*cos(pi/4)))/2;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%distance estimation
for n = 2:length(t)
    distDiffx_pd(n) = .5*(vx_pd(n) + vx_pd(n-1))*(1/fs);
    distDiffy_pd(n) = .5*(vy_pd(n) + vy_pd(n-1))*(1/fs);
    distTotx_pd(n) = distTotx_pd(n-1) + distDiffx_pd(n);
    distToty_pd(n) = distToty_pd(n-1) + distDiffy_pd(n);
    
    distDiffx_fft(n) = .5*(vx_fft(n) + vx_fft(n-1))*(1/fs);
    distDiffy_fft(n) = .5*(vy_fft(n) + vy_fft(n-1))*(1/fs);
    distTotx_fft(n) = distTotx_fft(n-1) + distDiffx_fft(n);
    distToty_fft(n) = distToty_fft(n-1) + distDiffy_fft(n);
end

figure;
plot(distTotx_pd,distToty_pd,'.');
figure;
plot(distTotx_fft,distToty_fft,'.');