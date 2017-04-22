function [fdopp1_pt, fdopp2_pt, vx_pt, vy_pt] = estVelocity_PD(n, phaseDiff1, phaseDiff2, fs, c_vac, fc, vx, vy)
    fdopp1_pt = (phaseDiff1(n) * fs)/(2*pi); %(estimated)
    fdopp2_pt = (phaseDiff2(n) * fs)/(2*pi); %(estimated)
    vx_pt = (((fdopp2_pt+fdopp1_pt)*c_vac/(2*fc)*sin(pi/4))+vx(n-1))/2;
    vy_pt = (((fdopp2_pt-fdopp1_pt)*c_vac/(2*fc)*cos(pi/4))+vy(n-1))/2;
end