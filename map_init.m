clear all
close all
clc

image = imread('boston_image.jpeg');

pixelCoords = [321 94 ;281  593 ;53 263];

refPoints = [-71.09718861143013 42.34734970925119; -71.03219610926209  42.350314151495574; -71.07510579753769 42.37227406795695];
R = calc_world_file(pixelCoords, refPoints);

worldfilewrite(R, 'boston_image.tif')