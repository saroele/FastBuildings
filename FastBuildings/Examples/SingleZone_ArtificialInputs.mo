within FastBuildings.Examples;

model SingleZone_ArtificialInputs "Single zone simulation based on artificial inputs for QHeaCoo and PEle"
  extends Modelica.Icons.Example;
  inner FastBuildings.Input.SIM_ArtificialInput simFasBui annotation(Placement(visible = true, transformation(origin = {-89.81699999999999, 88.52290000000001}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buildings.SZ_Inputs_powEle_Ventilation bui(redeclare FastBuildings.Zones.ZonWalInt_A zon(cZon = 1000000.0, cInt = 10000000.0, cWal = 10000000, rWal = 0.001, rInt = 0.01)) annotation(Placement(visible = true, transformation(origin = {28.1699, 29.7255}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StopTime = 162800), __Dymola_experimentSetupOutput);
end SingleZone_ArtificialInputs;