within FastBuildings.Experimental;

model HVAC_KK "Total HVAC model for KK"
  extends HVAC.Partial_HVAC;
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";
  parameter SI.ThermalResistance rLos = 1 "Total thermal resistance to the technical room, in K/W";
  parameter SI.HeatCapacity cHea = 1 "Thermal capacity of the zone";
  GB_QSet_ConstantEta gb annotation(Placement(transformation(extent = {{72, 30}, {92, 50}})));
  HP_AW_QSet_ConstantCOP hp1 annotation(Placement(transformation(extent = {{72, -10}, {92, 10}})));
  HP_AW_QSet_ConstantCOP hp2 annotation(Placement(transformation(extent = {{72, -50}, {92, -30}})));
  Zones.BaseClasses.Capacitor capHea(c = cHea) annotation(Placement(transformation(extent = {{-10, 60}, {10, 80}})));
  TwoPort_PrescribedHeatFlow qCon annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-70, 0})));
  TwoPort_PrescribedHeatFlow qRad annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-70, -40})));
  Modelica.Blocks.Sources.RealExpression expQCon(y = (1 - fraRad) * simFasBui.qHeaCoo) annotation(Placement(transformation(extent = {{-40, 10}, {-60, 30}})));
  Modelica.Blocks.Sources.RealExpression expQRad(y = fraRad * simFasBui.qHeaCoo) annotation(Placement(transformation(extent = {{-40, -30}, {-60, -10}})));
  HT.Sources.FixedHeatFlow qEmb(Q_flow = 0) annotation(Placement(transformation(extent = {{-60, 36}, {-80, 56}})));
  HT.Sources.PrescribedTemperature preTBou "Prescribed boundary temperature" annotation(Placement(transformation(extent = {{6, -6}, {-6, 6}}, rotation = 0, origin = {48, -74})));
  Zones.BaseClasses.Resistance resLos(r = rLos) "Resistance for heat losses to technical room" annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {22, -74})));
  Modelica.Blocks.Sources.Constant TTecRoom(k = 273.15 + 20) annotation(Placement(transformation(extent = {{80, -80}, {68, -68}})));
equation
  connect(heaPorCon, qCon.heaPor_b) annotation(Line(points = {{-99.83, 0.0682}, {-90, 0.0682}, {-90, 0}, {-80, 0}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(heaPorRad, qRad.heaPor_b) annotation(Line(points = {{-100.17, -40}, {-80, -40}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(qCon.heaPor_a, capHea.heaPor) annotation(Line(points = {{-60, 0}, {0, 0}, {0, 60}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(qRad.heaPor_a, capHea.heaPor) annotation(Line(points = {{-60, -40}, {0, -40}, {0, 60}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(expQCon.y, qCon.QSet) annotation(Line(points = {{-61, 20}, {-70, 20}, {-70, 10.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(expQRad.y, qRad.QSet) annotation(Line(points = {{-61, -20}, {-70, -20}, {-70, -29.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(heaPorEmb, qEmb.port) annotation(Line(points = {{-100.614, 40.944}, {-90, 40.944}, {-90, 46}, {-80, 46}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(preTBou.port, resLos.heaPor_a) annotation(Line(points = {{42, -74}, {32, -74}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(resLos.heaPor_b, capHea.heaPor) annotation(Line(points = {{12, -74}, {0, -74}, {0, 60}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(preTBou.T, TTecRoom.y) annotation(Line(points = {{55.2, -74}, {67.4, -74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gb.heaPorHot, capHea.heaPor) annotation(Line(points = {{72.017, 40.0068}, {0, 40.0068}, {0, 60}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(hp1.heaPorHot, capHea.heaPor) annotation(Line(points = {{72.017, 0.00682}, {0, 0}, {0, 60}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(hp2.heaPorHot, capHea.heaPor) annotation(Line(points = {{72.017, -39.9932}, {0, -39.9932}, {0, 60}}, color = {191, 0, 0}, smooth = Smooth.None));
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end HVAC_KK;