within FastBuildings.Experimental;
model Heating_Input_KK "Heat production for KK building"
  extends HVAC.Partial_HVAC;
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";

  GB_QSet_ConstantEta gb
    annotation (Placement(transformation(extent={{44,26},{64,46}})));
  HP_AW_QSet_ConstantCOP hp1
    annotation (Placement(transformation(extent={{44,-10},{64,10}})));
  HP_AW_QSet_ConstantCOP hp2
    annotation (Placement(transformation(extent={{44,-46},{64,-26}})));
  ThemalSplitter themalSplitter
    annotation (Placement(transformation(extent={{-26,-10},{-6,10}})));
equation
  connect(themalSplitter.heaPorRad, heaPorRad) annotation (Line(
      points={{-26.017,-4},{-56,-4},{-56,-40},{-100.17,-40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(themalSplitter.heaPorCon, heaPorCon) annotation (Line(
      points={{-25.983,0.00682},{-62.9915,0.00682},{-62.9915,0.0682},{-99.83,0.0682}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(themalSplitter.heaPorEmb, heaPorEmb) annotation (Line(
      points={{-25.983,3.99318},{-56,3.99318},{-56,40.944},{-100.614,40.944}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(themalSplitter.heaPorTot, gb.heaPorHot) annotation (Line(
      points={{-5.983,-0.19318},{16,-0.19318},{16,36.0068},{44.017,36.0068}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(themalSplitter.heaPorTot, hp1.heaPorHot) annotation (Line(
      points={{-5.983,-0.19318},{19.0085,-0.19318},{19.0085,0.00682},{44.017,0.00682}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(themalSplitter.heaPorTot, hp2.heaPorHot) annotation (Line(
      points={{-5.983,-0.19318},{16,-0.19318},{16,-35.9932},{44.017,-35.9932}},
      color={191,0,0},
      smooth=Smooth.None));

  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}}),                                                                                                    graphics));
end Heating_Input_KK;
