within FastBuildings.Zones;

model ZonWalInt_G "Ground heat losses connected to capWal"
  extends ZonWalInt_A;
  extends FastBuildings.Zones.BaseClasses.Partials.Partial_Ground;
equation
  connect(resGro.heaPor_a, capWal.heaPor) annotation(Line(points = {{-20, -80}, {-12, -80}, {-12, -58}, {-60, -58}, {-60, 10}}, color = {191, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {100, 100}}), graphics));
end ZonWalInt_G;