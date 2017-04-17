function [t, I, Q] = IQaccel(endSpeed,fs,fc,c)
    t = 0:(1/fs):8;
    Amp = 3.3/2;
    endFreq = 2*endSpeed*fc/c;
    I = Amp + Amp*chirp(t,0,8,endFreq,'linear');
    Q = Amp + Amp*chirp(t,0,8,endFreq,'linear', -90);
end

