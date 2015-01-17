within FastBuildings.Experimental;
model HP_AW_QSet_ConstantCOP "Air-water heat pump with constant COP and QSet"
  extends Partial_HeatProduction;

  parameter Real COP=3;
  SI.HeatFlowRate QSet = simFasBui.qHeaCoo;

equation
  heaPorHot.Q_flow = -QSet;
  PEle = QSet / COP;
  PFuel = 0;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end HP_AW_QSet_ConstantCOP;
