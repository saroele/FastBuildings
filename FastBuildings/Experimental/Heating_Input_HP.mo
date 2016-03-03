within FastBuildings.Experimental;

model Heating_Input_HP "Heating only, heating power read from input, with Heat Pump"
  extends HVAC.Partial_HVAC;
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";
  HP_AW_QSet_ConstantCOP hp annotation(Placement(transformation(extent = {{-30, 92}, {30, 34}})));
equation
  heaPorCon.Q_flow = (1 - fraRad) * hp.heaPorHot.Q_flow;
  heaPorRad.Q_flow = fraRad * hp.heaPorHot.Q_flow;
  heaPorEmb.Q_flow = 0;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Heating_Input_HP;