within FastBuildings.Experimental;

model HP_AW_QSet_COP_TAmb_TSupInput "Air-water heat pump with QSet and COP based on TAmb and TSup as input"
  extends Partial_HeatProduction;
  outer Input.BaseClasses.Partial_SIM simFasBui "Weather and input data, to be provided by an inner submodel of Partial_SIM" annotation(Placement(visible = true, transformation(origin = {-90.1538, 89.5214}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PEle annotation(Placement(transformation(extent = {{96, 30}, {116, 50}})));
  Modelica.Blocks.Interfaces.RealOutput PFuel annotation(Placement(transformation(extent = {{96, -50}, {116, -30}})));
  parameter Real COP_0 = 3;
  parameter Real fTAmb = 0.1;
  parameter Real fTSup = -0.1;
  Real COP = COP_0 + fTAmb * (simFasBui.TAmb - (7 + 273.15)) + fTSup * (TSup - (35 + 273.15));
  Modelica.Blocks.Interfaces.RealInput QSet annotation(Placement(transformation(extent = {{-126, 40}, {-86, 80}})));
  Modelica.Blocks.Interfaces.RealInput TSup annotation(Placement(transformation(extent = {{-126, 12}, {-86, 52}})));
equation
  PEle * COP = QSet;
  PFuel = 0;
  connect(QSet, preQ.Q_flow) annotation(Line(points = {{-106, 60}, {-20, 60}, {-20, 0}, {-40, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end HP_AW_QSet_COP_TAmb_TSupInput;