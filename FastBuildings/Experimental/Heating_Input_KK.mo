within FastBuildings.Experimental;
model Heating_Input_KK "Heat production for KK building"
  extends HVAC.Partial_HVAC;
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";

  GB_QSet_ConstantEta gb
    annotation (Placement(transformation(extent={{6,64},{26,84}})));
  HP_AW_QSet_ConstantCOP hp1
    annotation (Placement(transformation(extent={{6,28},{26,48}})));
  HP_AW_QSet_ConstantCOP hp2
    annotation (Placement(transformation(extent={{6,-8},{26,12}})));
equation
  heaPorCon.Q_flow = -(1 - fraRad) * (gb.Q+hp1.Q+hp2.Q);
  heaPorRad.Q_flow = -fraRad * (gb.Q+hp1.Q+hp2.Q);
  heaPorEmb.Q_flow = 0;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}}),                                                                                                    graphics));
end Heating_Input_KK;
