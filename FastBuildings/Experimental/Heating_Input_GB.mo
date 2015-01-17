within FastBuildings.Experimental;
model Heating_Input_GB "Heating only, heating power read from input, with GB"
  extends HVAC.Partial_HVAC;
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";

  GB_QSet_ConstantEta gb
    annotation (Placement(transformation(extent={{20,92},{80,34}})));
equation
  heaPorCon.Q_flow = -(1 - fraRad) * gb.Q;
  heaPorRad.Q_flow = -fraRad * gb.Q;
  heaPorEmb.Q_flow = 0;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}}),                                                                                                    graphics));
end Heating_Input_GB;
