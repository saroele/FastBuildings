within FastBuildings.Experimental;
model HP_AW_QSet_ConstantCOP "Air-water heat pump with constant COP and QSet"
  extends Partial_HeatProduction;

  parameter Real COP=3;

  Modelica.Blocks.Interfaces.RealInput QSet
    annotation (Placement(transformation(extent={{-126,-80},{-86,-40}})));

equation
  heaPorHot.Q_flow = -QSet;
  PEle = QSet / COP;
  PFuel = 0;

end HP_AW_QSet_ConstantCOP;
