function R = calc_world_file(pixelCoords, refPoints)
 M = [pixelCoords ones(length(pixelCoords), 1)];
 M
 refPoints(:,1)
A1 = linsolve(M, refPoints(:,1));
A2 = linsolve(M, refPoints(:,2));
R = [A1, A2];
R
end