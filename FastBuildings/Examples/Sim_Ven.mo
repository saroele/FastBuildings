within FastBuildings.Examples;

model Sim_Ven
  extends Modelica.Icons.Example;
  inner FastBuildings.Input.SIM_Inputs simFasBui annotation(Placement(visible = true, transformation(origin = {-82, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 10, freqHz = 1 / 40000, offset = 273) annotation(Placement(visible = true, transformation(origin = {-80, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buildings.SZ_Inputs_powEle_qVen bui(redeclare FastBuildings.Zones.ZonInt_A zon(rWal = 1e-3, rInt = 1e-5, cInt = 1e7, cZon = 1e8), ven.mFloVen = 1, redeclare FastBuildings.HVAC.Heating_Input hva) annotation(Placement(visible = true, transformation(origin = {2, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse pulse1(period = 86400, startTime = 20000) annotation(Placement(visible = true, transformation(origin = {-74, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  sine1.y = simFasBui.TAmb;
  simFasBui.qHeaCoo = 1000;
  simFasBui.irr[1] = 0;
  simFasBui.TSet = 0;
  simFasBui.powEle = 0;
  pulse1.y = bui.ven.prfVen;
  bui.ven.TSupVen = 19 + 273.15;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Sim_Ven;