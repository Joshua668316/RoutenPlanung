clear All
close All
clc

roadspec = makesymbolspec('Line',...
                          {'ADMIN_TYPE',0,'Color','cyan'}, ...
                          {'ADMIN_TYPE',3,'Color','red'},...
                          {'CLASS',6,'Visible','on'},...
                          {'CLASS',[1 4],'LineWidth',2},...
                          {'CLASS',[1 4], 'Color','blue'});

streets = load('allGeo.mat');
R = worldfileread('boston_image.tif');
image = imread('boston_image.jpeg');
figure
mapshow(image,R)
mapshow(streets.allGeo,'SymbolSpec',roadspec);

axis image
title('Boston')
