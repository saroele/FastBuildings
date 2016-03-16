within FastBuildings.Experimental;

model HP_AW_PEleSet "Air-water heat pump with PEleSet and COP based on TAmb, Pele and TSup"
  extends Partial_HeatProduction;
  outer Input.BaseClasses.Partial_SIM simFasBui "Weather and input data, to be provided by an inner submodel of Partial_SIM" annotation(Placement(visible = true, transformation(origin = {-90.1538, 89.5214}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PEle annotation(Placement(transformation(extent = {{96, 30}, {116, 50}})));
  Modelica.Blocks.Interfaces.RealOutput PFuel annotation(Placement(transformation(extent = {{96, -50}, {116, -30}})));
  /*
                                      The equation for the COP is a GLM found by OLS regression with statsmodels.
                                      To obtain a generic model, a backward selection is performed based on a full
                                      factorial model with TAmb, TSup and PEle as predictors.
                                      
                                      The predictors are shifted so the intercept is a realistic value for these 
                                      conditions: 
                                      - full load
                                      - Temperature regime of 7/35
                                      
                                      The parameters can (and some will) be zero. 
                                      */
  parameter Real Intercept = 0;
  parameter Real TAmb7 = 0;
  parameter Real TSup35 = 0;
  parameter Real E6500 = 0;
  parameter Real TAmb7_TSup35 = 0;
  parameter Real TAmb7_E6500 = 0;
  parameter Real TSup35_E6500 = 0;
  parameter Real TAmb7_TSup35_E6500 = 0;
  Real Q = PEleSet * COP;
  Real TAmb_7 = simFasBui.TAmb - (7 + 273.15);
  Real TSup_35 = heaPorHot.T - (35 + 273.15);
  Real PEle_6500 = PEleSet - 6500;
  Real COP = Intercept + TAmb7 * TAmb_7 + TSup35 * TSup_35 + E6500 * PEle_6500 + TAmb7_TSup35 * (TAmb_7 * TSup_35) + TAmb7_E6500 * (TAmb_7 * PEle_6500) + TSup35_E6500 * (TSup_35 * PEle_6500) + TAmb7_TSup35_E6500 * (TAmb_7 * TSup_35 * PEle_6500);
  Modelica.Blocks.Interfaces.RealInput PEleSet "Set point for electrical power, in W" annotation(Placement(transformation(extent = {{-126, 40}, {-86, 80}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y = Q) annotation(Placement(transformation(extent = {{2, -10}, {-18, 10}})));
equation
  PEle = PEleSet;
  PFuel = 0;
  connect(preQ.Q_flow, realExpression.y) annotation(Line(points = {{-40, 0}, {-19, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end HP_AW_PEleSet;