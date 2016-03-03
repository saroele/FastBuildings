within FastBuildings.Experimental;

model KK_HVAC_ONLY "Just HVAC for KK "
  outer Input.BaseClasses.Partial_SIM simFasBui "Weather data, to be provided by an inner submodel of Partial_SIM" annotation(Placement(visible = true, transformation(origin = {-90.1538, 89.5214}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable FastBuildings.Experimental.HVAC_KK_TAmb hva annotation(Placement(visible = true, transformation(origin = {0.1197, -1.3162}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HT.Sources.FixedTemperature preTZon(T = 293.15) annotation(Placement(transformation(extent = {{-68, -14}, {-48, 6}})));
  Modelica.Blocks.Sources.Constant const(k = 293.15) annotation(Placement(transformation(extent = {{-58, -50}, {-38, -30}})));
equation
  connect(preTZon.port, hva.heaPorEmb) annotation(Line(points = {{-48, -4}, {-32, -4}, {-32, 2.67698}, {-9.8633, 2.67698}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(preTZon.port, hva.heaPorCon) annotation(Line(points = {{-48, -4}, {-30, -4}, {-30, -1.30938}, {-9.8633, -1.30938}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(preTZon.port, hva.heaPorRad) annotation(Line(points = {{-48, -4}, {-30, -4}, {-30, -5.3162}, {-9.8973, -5.3162}}, color = {191, 0, 0}, smooth = Smooth.None));
  connect(const.y, hva.TZon) annotation(Line(points = {{-37, -40}, {-32, -40}, {-32, -9.35027}, {-9.8381, -9.35027}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics));
end KK_HVAC_ONLY;