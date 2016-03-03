within FastBuildings.Zones;

model ZonWalEmb_C "incl. ground, heaPorRad connected to capWal, additional infiltration"
  extends ZonWalEmb_A;
  extends FastBuildings.Zones.BaseClasses.Partials.Partial_Ground;
  parameter SI.ThermalResistance rInf = 1 "Total thermal resistance of infiltration and static heat losses, in K/W";
  BaseClasses.Resistance resInf(r = rInf) "Infiltration (and static heat loss)" annotation(Placement(transformation(extent = {{-100, -60}, {-80, -40}})));
equation
  connect(resInf.heaPor_b, capZon.heaPor) annotation(Line(points = {{-80, -50}, {20, -50}, {20, 60}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(resInf.heaPor_a, preTAmb.port) annotation(Line(points = {{-100, -50}, {-112, -50}, {-112, 0}, {-130, 0}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(resGro.heaPor_a, capEmb.heaPor) annotation(Line(points = {{-20, -80}, {-20, -60}, {60, -60}, {60, 60}}, color = {191, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-200, -100}, {100, 100}}), graphics));
end ZonWalEmb_C;