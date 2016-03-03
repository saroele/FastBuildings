within FastBuildings.Experimental;

model Heating_Input_GB "Heating only, heating power read from input, with GB"
  extends HVAC.Partial_HVAC;
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";
  GB_QSet_ConstantEta gb annotation(Placement(transformation(extent = {{20, 34}, {80, 92}})));
equation
  heaPorCon.Q_flow = -(1 - fraRad) * gb.Q;
  heaPorRad.Q_flow = -fraRad * gb.Q;
  heaPorEmb.Q_flow = 0;
  connect(simFasBui.qHeaCoo, gb.QSet) annotation(Line(points = {{-82.193, 78.5462}, {-82.193, 60}, {-16, 60}, {-16, 80.4}, {18.2, 80.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Heating_Input_GB;