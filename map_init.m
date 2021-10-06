
for i = 1:6 
    shp = shaperead('boston_roads.shp','Selector',...
       {@(v1) (v1 <= 1), 'CLASS'}  );
    filename = sprintf('road_class_%u.mat',i);
    save(filename, 'shp');
end