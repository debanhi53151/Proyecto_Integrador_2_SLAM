function scanMsgs = leerLidarRosbag(bag)
% Extrae mensajes del topic /scan
bagScan = select(bag,'Topic','/scan');
scanMsgs = readMessages(bagScan,'DataFormat','struct');
end
