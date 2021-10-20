
for i = 1:6 
    shp = shaperead('boston_roads.shp','Selector',...
       {@(v1) (v1 == i), 'CLASS'}  );
    filename = sprintf('road_class_%u.mat',i);
    save(filename, 'shp');
end

highway = shaperead('boston_roads.shp','Selector',...
       {@(v1) (v1 <= 3), 'CLASS'}  );
local = shaperead('boston_roads.shp','Selector',...
       {@(v1) (v1 >= 4 && v1 <= 7), 'CLASS'}  );
all = shaperead('boston_roads.shp','Selector',...
       {@(v1) (v1 >= 1 && v1 <= 7), 'CLASS'}  );
    
save('highway.mat', 'highway');
save('local.mat', 'local');
save('all.mat','all');

higwayGeo = get_lat_lon_from_boston(highway);
localGeo = get_lat_lon_from_boston(local);
allGeo = get_lat_lon_from_boston(all);

save('higwayGeo.mat', 'higwayGeo')
save('localGeo.mat', 'localGeo')
save('allGeo.mat', 'allGeo')
figure
mapshow(allGeo, 'Color', 'green');