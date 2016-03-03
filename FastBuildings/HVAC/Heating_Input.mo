within FastBuildings.HVAC;

model Heating_Input "Heating only, heating power read from input"
  extends Partial_HVAC;
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";
equation
  heaPorCon.Q_flow = -(1 - fraRad) * simFasBui.qHeaCoo;
  heaPorRad.Q_flow = -fraRad * simFasBui.qHeaCoo;
  heaPorEmb.Q_flow = 0;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Heating_Input;