%need to add low pass filter
%need to add file read
%need to add FFT estimation / moving average
%need to add heading
%need to add mounting angle offsets

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

plot3(t(1:501), I1(1:501), Q1(1:501)); %plot IQ data

%convert IQ to complex form
dataCplx1 = complex(I1,Q1);
absArray1 = abs(dataCplx1);
phaseArray1 = angle(dataCplx1);

dataCplx2 = complex(I2,Q2);
absArray2 = abs(dataCplx2);
phaseArray2 = angle(dataCplx2);

%determine phase difference for forward or backward movement
%estimate doppler freqs and velocities
phaseDiff1 = zeros(1,length(t));
phaseDiff2 = zeros(1,length(t));
fdopp1 = zeros(1,length(t));
fdopp2 = zeros(1,length(t));
vx = zeros(1,length(t));
vy = zeros(1,length(t));
distDiffx = zeros(1,length(t));
distDiffy = zeros(1,length(t));
distTotx = zeros(1,length(t));
distToty = zeros(1,length(t));
n = 2;
[phaseDiff1(n), phaseDiff2(n), fdopp1(n), fdopp2(n), vx(n), vy(n)] = estVelocity(2, phaseArray1, phaseArray2, fs, c_vac, fc, vx, vy);
vx(2) = 2*vx(2);
vy(2) = 2*vy(2);
phaseDiff1(1) = phaseDiff1(2); %assume first sample is same as second (for now)
phaseDiff2(1) = phaseDiff2(2);
fdopp1(1) = fdopp1(2);
fdopp2(1) = fdopp2(2);
vx(1) = vx(2);
vy(1) = vy(2);
for n = 3:length(t)
    [phaseDiff1(n), phaseDiff2(n), fdopp1(n), fdopp2(n), vx(n), vy(n)] = estVelocity(n, phaseArray1, phaseArray2, fs, c_vac, fc, vx, vy);
end

for n = 2:length(t)
    distDiffx(n) = .5*(vx(n) + vx(n-1))*(1/fs);
    distDiffy(n) = .5*(vy(n) + vy(n-1))*(1/fs);
    distTotx(n) = distTotx(n-1) + distDiffx(n);
    distToty(n) = distToty(n-1) + distDiffy(n);
end
plot(distTotx,distToty,'.');