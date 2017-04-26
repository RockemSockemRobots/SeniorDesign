function [t, I1, Q1, I2, Q2 ] = constSpeedCircleIQGen( rad_dist, v_tan,fs,fc,c)
    w = rad_dist*v_tan;
    tLength = rad_dist/w;
    t = 0:(1/fs):tLength;
    s = t.*w;
    v_x = v_tan.*cos(s);
    v_y = v_tan.*sin(s);
    Amp = 3.3/2;
    freq_1 = 2*v_x*fc/c;
    freq_2 = 2*v_y*fc/c;
    
end

