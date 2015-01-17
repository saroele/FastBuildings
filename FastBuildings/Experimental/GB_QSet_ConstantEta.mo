within FastBuildings.Experimental;
model GB_QSet_ConstantEta "Gas boiler with constant eta and QSet"
  extends Partial_HeatProduction;

  parameter Real eta=0.9 "Efficiency on UPPER heating value";

  Modelica.Blocks.Interfaces.RealInput QSet
    annotation (Placement(transformation(extent={{-126,-80},{-86,-40}})));

equation
  heaPorHot.Q_flow = -QSet;
  PEle = 0;
  PFuel = QSet/eta;

end GB_QSet_ConstantEta;
