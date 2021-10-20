function roads_geo_out = get_lat_lon_from_boston(shapeData)
% shape lesen
roads = shapeData;
roads_geo_out = shapeData; % leere Datenstruktur für Ausgabe anlegen

% NAD83 Projektionsinfo laden  von geographische Koordinaten nach NAD83 [sf]
info = geotiffinfo('boston.tif');
%Über alle Strassensegmente
for i=1 : length(roads)
  % Über alle Formpunkte eines Strassensegmentes
  for k=1:length(roads(i).X)
   % boston_roads ist in  meter  angegeben
   %  Umwandlung von  meter  nach ‚survey feet 
   x = roads(i).X(k) * unitsratio('sf','m');
   y = roads(i).Y(k) * unitsratio('sf','m');
   % Berechnet die inverse Projektion
   %  also von NAD83 [sf] nach geographische Koordinate 
   [lat, lon] = projinv(info, x, y);
   roads_geo_out(i).Y(k) = lat;
   roads_geo_out(i).X(k) = lon;
  end 
  i / length(roads)
end

end