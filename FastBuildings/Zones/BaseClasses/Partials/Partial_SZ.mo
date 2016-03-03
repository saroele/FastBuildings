within FastBuildings.Zones.BaseClasses.Partials;

partial model Partial_SZ "Single zone partial model, no air node"
  parameter Integer nIrr = 1 "Number of irradiation inputs/windows";
  HT.Interfaces.HeatPort_a heaPorCon "Convective heat transfer" annotation(Placement(visible = true, transformation(extent = {{92, -8}, {108, 8}})));
  HT.Interfaces.HeatPort_a heaPorRad "Radiative heat transfer" annotation(Placement(transformation(extent = {{92, -48}, {108, -32}})));
  //parameter Boolean booEmb = true "if true, add a heatPort for Embedded heat transfer";
  HT.Interfaces.HeatPort_b heaPorEmb "Heat transfer to embedded systems, like tabs" annotation(Placement(visible = true, transformation(origin = {99.9999, 39.9528}, extent = {{-7.9999, -7.9528}, {7.9999, 7.9528}}, rotation = 0), iconTransformation(origin = {100, 39.9057}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput TZon "Zone temperature. Most often this will be air temperature" annotation(Placement(transformation(extent = {{96, -90}, {116, -70}}), iconTransformation(extent = {{90, -90}, {110, -70}})));
  outer Input.BaseClasses.Partial_SIM simFasBui "Input data, to be provided by an inner submodel of PartialSIM" annotation(Placement(transformation(extent = {{-200, 80}, {-180, 100}})));
  annotation(Diagram(coordinateSystem(extent = {{-200, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics), Icon(coordinateSystem(extent = {{-200, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Polygon(origin = {0.130719, 0.130719}, points = {{-200.131, 99.8693}, {-200.131, -40.1307}, {-60.1307, -40.1307}, {-60.1307, -100.131}, {99.8693, -100.131}, {99.8693, 99.8693}, {-200.131, 99.8693}})}));
end Partial_SZ;