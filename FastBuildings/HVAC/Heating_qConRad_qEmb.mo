within FastBuildings.HVAC;

model Heating_qConRad_qEmb "Heating/cooling from two inputs: qConRad (distributed to radiative and convective ports) and embedded"


  extends Partial_HVAC(redeclare FastBuildings.Input.SIM_Inputs_qConRad_qEmb simFasBui);
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";
equation
  heaPorCon.Q_flow = -(1 - fraRad) * simFasBui.qConRad;
  heaPorRad.Q_flow = -fraRad * simFasBui.qConRad;
  heaPorEmb.Q_flow = -simFasBui.qEmb;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));

end Heating_qConRad_qEmb;