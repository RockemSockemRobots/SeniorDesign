function [phaseDiff1_pt, phaseDiff2_pt, fdopp1_pt, fdopp2_pt, vx_pt, vy_pt] = estVelocity(n, phaseArray1, phaseArray2, fs, c_vac, fc, vx, vy)
    phaseDiff1_pt = mod(phaseArray1(n) - phaseArray1(n-1) + 3*pi, 2*pi) - pi;
    phaseDiff2_pt = mod(phaseArray2(n) - phaseArray2(n-1) + 3*pi, 2*pi) - pi;
    fdopp1_pt = (phaseDiff1_pt * fs)/(2*pi); %(estimated)
    fdopp2_pt = (phaseDiff2_pt * fs)/(2*pi); %(estimated)
    vx_pt = (((fdopp2_pt+fdopp1_pt)*c_vac/(2*fc)*sin(pi/4))+vx(n-1))/2;
    vy_pt = (((fdopp2_pt-fdopp1_pt)*c_vac/(2*fc)*cos(pi/4))+vy(n-1))/2;
end

