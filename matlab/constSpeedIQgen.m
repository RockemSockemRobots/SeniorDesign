function [t, I, Q] = constSpeedIQgen(speed, fs, fc, c, tLength)
%freq in Hz, fs in Hz, tLength in sec
    t = 0:(1/fs):(tLength);
    Amp = 3.3/2;
    freq = 2*speed*fc/c;
    I = Amp + Amp*cos(2*pi*freq*t);
    Q = Amp + Amp*cos(2*pi*freq*t-pi/2);
end