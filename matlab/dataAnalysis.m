tic;
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
%[t, I1, Q1] = constSpeedIQgen(9.872129045*sin(pi/4),fs,fc,c_air,30); %generate IQ data
%[t, I1, Q1] = constSpeedIQgen(10.17926195*sin(pi/4),fs,fc,c_air,30); %generate IQ data
[t, I1, Q1] = constSpeedIQgen(10*sin(pi/4),fs,fc,c_air,30);
%[t, I1, Q1] = IQaccel(40*sin(pi/4),fs,fc,c_air,8); %generate IQ data
I1 = I1 - dcOff;
Q1 = Q1 - dcOff;
I2 = I1;
Q2 = Q1;

figure('Name','IQplot');
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
[fdopp1_pd(n), fdopp2_pd(n), vx_pd(n), vy_pd(n)] = estVelocity_PD(2, phaseDiff1, phaseDiff2, fs, c_air, fc, vx_pd, vy_pd);
vx_pd(2) = 2*vx_pd(2);
vy_pd(2) = 2*vy_pd(2);
fdopp1_pd(1) = fdopp1_pd(2);
fdopp2_pd(1) = fdopp2_pd(2);
for n = 3:length(t)
    [fdopp1_pd(n), fdopp2_pd(n), vx_pd(n), vy_pd(n)] = estVelocity_PD(n, phaseDiff1, phaseDiff2, fs, c_air, fc, vx_pd, vy_pd);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%estimations with FFT
N = 256; %N-point FFT
fdopp1_fft = zeros(1,length(t));
fdopp2_fft = zeros(1,length(t));
vx_fft = zeros(1,length(t));
vy_fft = zeros(1,length(t));
distDiffx_fft = zeros(1,length(t));
distDiffy_fft = zeros(1,length(t));
distTotx_fft = zeros(1,length(t));
distToty_fft = zeros(1,length(t));

n = N;
dft1 = fft(dataCplx1((n-(N-1)):n),N);
[peak1,freqInd1] = max(abs(dft1));
dft2 = fft(dataCplx2((n-(N-1)):n),N);
[peak2,freqInd2] = max(abs(dft2));
freqArr = 0:fs/N:fs/2;
magNext1 = 0;
magPrev1 = 0;
magNext2 = 0;
magPrev2 = 0;
if(freqInd1 ~= N) 
    magNext1 = abs(dft1(freqInd1+1));
end
if(freqInd1 ~= 1)
    magPrev1 = abs(dft1(freqInd1-1));
end
if(freqInd2 ~= N) 
    magNext2 = abs(dft2(freqInd2+1));
end
if(freqInd2 ~= 1)
    magPrev2 = abs(dft2(freqInd2-1));
end
if(magNext1 > magPrev1)
    fdopp1_fft((n-(N-1)):n) = freqArr(freqInd1) + (magNext1/peak1)*.5*fs/N;
elseif(magNext1 < magPrev1)
    fdopp1_fft((n-(N-1)):n) = freqArr(freqInd1) + (magPrev1/peak1)*.5*fs/N;
else
    fdopp1_fft((n-(N-1)):n) = freqArr(freqInd1);
end
if(magNext2 > magPrev2)
    fdopp2_fft((n-(N-1)):n) = freqArr(freqInd2) + (magNext2/peak2)*.5*fs/N;
elseif(magNext2 < magPrev2)
    fdopp2_fft((n-(N-1)):n) = freqArr(freqInd2) + (magPrev2/peak2)*.5*fs/N;
else
    fdopp2_fft((n-(N-1)):n) = freqArr(freqInd2);
end
vx_fft((n-(N-1)):n) = ((fdopp2_fft((n-(N-1)):n)+fdopp1_fft((n-(N-1)):n))*c_air/(2*fc)*sin(pi/4));
vy_fft((n-(N-1)):n) = ((fdopp2_fft((n-(N-1)):n)-fdopp1_fft((n-(N-1)):n))*c_air/(2*fc)*cos(pi/4));
for n = (N+1):length(t)
    dft1 = fft(dataCplx1((n-(N-1)):n),N);
    [peak1,freqInd1] = max(abs(dft1));
    dft2 = fft(dataCplx2((n-(N-1)):n),N);
    [peak2,freqInd2] = max(abs(dft2));
    freqArr = 0:fs/N:fs/2;
    magNext1 = 0;
    magPrev1 = 0;
    magNext2 = 0;
    magPrev2 = 0;
    if(freqInd1 ~= N) 
        magNext1 = abs(dft1(freqInd1+1));
    end
    if(freqInd1 ~= 1)
        magPrev1 = abs(dft1(freqInd1-1));
    end
    if(freqInd2 ~= N) 
        magNext2 = abs(dft2(freqInd2+1));
    end
    if(freqInd2 ~= 1)
        magPrev2 = abs(dft2(freqInd2-1));
    end
    if(magNext1 > magPrev1)
        fdopp1_fft((n-(N-1)):(n-1)) = (fdopp1_fft((n-(N-1)):(n-1)) + (freqArr(freqInd1) + (magNext1/peak1)*.5*fs/N))/2;
        fdopp1_fft(n) = freqArr(freqInd1) + (magNext1/peak1)*.5*fs/N;
    elseif(magNext1 < magPrev1)
        fdopp1_fft((n-(N-1)):(n-1)) = (fdopp1_fft((n-(N-1)):(n-1)) + (freqArr(freqInd1) + (magPrev1/peak1)*.5*fs/N))/2;
        fdopp1_fft(n) = freqArr(freqInd1) + (magNext1/peak1)*.5*fs/N;
    else
        fdopp1_fft((n-(N-1)):(n-1)) = (fdopp1_fft((n-(N-1)):(n-1)) + freqArr(freqInd1))/2;
        fdopp1_fft(n) = freqArr(freqInd1);
    end
    
    if(magNext2 > magPrev2)
        fdopp2_fft((n-(N-1)):(n-1)) = (fdopp2_fft((n-(N-1)):(n-1)) + (freqArr(freqInd2) + (magNext2/peak2)*.5*fs/N))/2;
        fdopp2_fft(n) = freqArr(freqInd2) + (magNext2/peak2)*.5*fs/N;
    elseif(magNext2 < magPrev2)
        fdopp2_fft((n-(N-1)):(n-1)) = (fdopp2_fft((n-(N-1)):(n-1)) + (freqArr(freqInd2) + (magPrev2/peak2)*.5*fs/N))/2;
        fdopp2_fft(n) = freqArr(freqInd2) + (magNext2/peak2)*.5*fs/N;
    else
        fdopp2_fft((n-(N-1)):(n-1)) = (fdopp2_fft((n-(N-1)):(n-1)) + freqArr(freqInd2))/2;
        fdopp2_fft(n) = freqArr(freqInd2);
    end
    
    vx_fft((n-(N-1)):(n-1)) = (vx_fft((n-(N-1)):(n-1)) + ((fdopp2_fft((n-(N-1)):(n-1))+fdopp1_fft((n-(N-1)):(n-1)))*c_air/(2*fc)*sin(pi/4)))/2;
    vx_fft(n) = ((fdopp2_fft(n)+fdopp1_fft(n))*c_air/(2*fc)*sin(pi/4));
    vy_fft((n-(N-1)):(n-1)) = (vy_fft((n-(N-1)):(n-1)) + ((fdopp2_fft((n-(N-1)):(n-1))-fdopp1_fft((n-(N-1)):(n-1)))*c_air/(2*fc)*cos(pi/4)))/2;
    vy_fft(n) = ((fdopp2_fft(n)-fdopp1_fft(n))*c_air/(2*fc)*cos(pi/4));
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

figure('Name','Velocity_PD');
plot(t,vx_pd,'b.');
hold on
plot(t,vy_pd,'r.');
title('Velocity Estimation Using Phase Difference');
xlabel('time (s)');
ylabel('velocity (m/s)');

figure('Name','Location_PD');
plot(distTotx_pd,distToty_pd,'.');
title('Location Estimation Using Phase Difference');
xlabel('x distance (m)');
ylabel('y distance (m)');

figure('Name','Velocity_FFT');
plot(t,vx_fft,'b.');
hold on
plot(t,vy_fft,'r.');
title('Velocity Estimation Using FFT');
xlabel('time (s)');
ylabel('velocity (m/s)');

figure('Name','Location_FFT');
plot(distTotx_fft,distToty_fft,'.');
title('Location Estimation Using FFT');
xlabel('x distance (m)');
ylabel('y distance (m)');
toc;

figure;
plot(freqArr, abs(dft1(1:129)),'.');