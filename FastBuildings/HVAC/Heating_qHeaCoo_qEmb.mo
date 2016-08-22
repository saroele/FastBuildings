within FastBuildings.HVAC;

model Heating_qHeaCoo_qEmb "Heating/cooling from two inputs: qHeaCoo (distributed to radiative and convective ports) and embedded"


  extends Partial_HVAC;
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";
equation
  heaPorCon.Q_flow = -(1 - fraRad) * simFasBui.qHeaCoo;
  heaPorRad.Q_flow = -fraRad * simFasBui.qHeaCoo;
  heaPorEmb.Q_flow = -simFasBui.qEmb;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));

end Heating_qHeaCoo_qEmb;