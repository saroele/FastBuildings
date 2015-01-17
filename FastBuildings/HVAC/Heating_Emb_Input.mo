within FastBuildings.HVAC;
model Heating_Emb_Input
  "Heating through embedded port, heating power read from input"
  extends Partial_HVAC;

equation
  heaPorCon.Q_flow = 0;
  heaPorRad.Q_flow = 0;
  heaPorEmb.Q_flow = -simFasBui.qHeaCoo;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}}),                                                                                                    graphics));
end Heating_Emb_Input;
