within FastBuildings.Zones.BaseClasses.Partials;

partial model Partial_Ground "Partial model for heat losses to the ground, with fixed TGro"
  parameter SI.ThermalResistance rGro = 1 "Total thermal resistance to the ground, in K/W";
  parameter SI.Temperature TGro = 285.15 "Fixed ground temperature" annotation(Evaluate = false);
  HT.Sources.FixedTemperature preTGro(T = TGro) "Fixed ground temperature" annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-84, -80})));
  Resistance resGro(r = rGro) "Resistance for heat losses to the ground" annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-30, -80})));
equation
  connect(preTGro.port, resGro.heaPor_b) annotation(Line(points = {{-74, -80}, {-40, -80}}, color = {191, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(graphics));
end Partial_Ground;