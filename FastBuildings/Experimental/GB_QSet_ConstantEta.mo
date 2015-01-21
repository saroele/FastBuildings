within FastBuildings.Experimental;
model GB_QSet_ConstantEta "Gas boiler with constant eta and QSet"
  //extends Partial_HeatProduction;
  outer Input.BaseClasses.Partial_SIM simFasBui
    "Weather and input data, to be provided by an inner submodel of Partial_SIM"
                                                                                                        annotation(Placement(visible = true, transformation(origin={-90.1538,
            89.5214},                                                                                                    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PEle
    annotation (Placement(transformation(extent={{96,30},{116,50}})));
  Modelica.Blocks.Interfaces.RealOutput PFuel
    annotation (Placement(transformation(extent={{96,-50},{116,-30}})));
  parameter Real eta=0.9 "Efficiency on UPPER heating value";

  Modelica.Blocks.Interfaces.RealOutput Q "Heat production" annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-106,0})));
  Modelica.Blocks.Interfaces.RealInput QSet
    annotation (Placement(transformation(extent={{-126,40},{-86,80}})));
equation
  Q = QSet;
  PEle = 0;
  PFuel = Q/eta;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end GB_QSet_ConstantEta;
