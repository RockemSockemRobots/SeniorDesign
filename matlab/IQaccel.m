function [t, I, Q] = IQaccel(endSpeed,fs,fc,c,tLength)
    t = 0:(1/fs):tLength;
    Amp = 3.3/2;
    endFreq = 2*endSpeed*fc/c;
    I = Amp + Amp*chirp(t,0,tLength,endFreq,'linear');
    Q = Amp + Amp*chirp(t,0,tLength,endFreq,'linear', -90);
end

