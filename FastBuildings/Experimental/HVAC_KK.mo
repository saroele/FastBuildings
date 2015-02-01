within FastBuildings.Experimental;
model HVAC_KK "Total HVAC model for KK"
  extends HVAC.Partial_HVAC;
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";
  parameter SI.HeatCapacity cHea = 1 "Thermal capacity of the zone";

  GB_QSet_ConstantEta gb
    annotation (Placement(transformation(extent={{72,30},{92,50}})));
  HP_AW_QSet_ConstantCOP hp1
    annotation (Placement(transformation(extent={{72,-10},{92,10}})));
  HP_AW_QSet_ConstantCOP hp2
    annotation (Placement(transformation(extent={{72,-50},{92,-30}})));
  Zones.BaseClasses.Capacitor capHea(c=cHea)
    annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  HT.Sources.PrescribedHeatFlow qgb
    annotation (Placement(transformation(extent={{60,30},{40,50}})));
  HT.Sources.PrescribedHeatFlow qhp1
    annotation (Placement(transformation(extent={{60,-10},{40,10}})));
  HT.Sources.PrescribedHeatFlow qhp2
    annotation (Placement(transformation(extent={{60,-50},{40,-30}})));
  TwoPort_PrescribedHeatFlow qCon annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-70,0})));
  TwoPort_PrescribedHeatFlow qRad annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-70,-40})));
  Modelica.Blocks.Sources.RealExpression expQCon(y=(1 - fraRad)*simFasBui.qHeaCoo)
    annotation (Placement(transformation(extent={{-40,10},{-60,30}})));
  Modelica.Blocks.Sources.RealExpression expQRad(y=fraRad*simFasBui.qHeaCoo)
    annotation (Placement(transformation(extent={{-40,-30},{-60,-10}})));
  HT.Sources.FixedHeatFlow      qEmb(Q_flow=0)
    annotation (Placement(transformation(extent={{-60,36},{-80,56}})));
equation
  connect(gb.Q, qgb.Q_flow) annotation (Line(
      points={{71.4,40},{60,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hp1.Q, qhp1.Q_flow) annotation (Line(
      points={{71.4,0},{60,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qhp2.Q_flow, hp2.Q) annotation (Line(
      points={{60,-40},{71.4,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qgb.port, capHea.heaPor) annotation (Line(
      points={{40,40},{0,40},{0,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(qhp1.port, capHea.heaPor) annotation (Line(
      points={{40,0},{0,0},{0,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(qhp2.port, capHea.heaPor) annotation (Line(
      points={{40,-40},{0,-40},{0,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heaPorCon, qCon.heaPor_b) annotation (Line(
      points={{-99.83,0.0682},{-90,0.0682},{-90,0},{-80,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heaPorRad, qRad.heaPor_b) annotation (Line(
      points={{-100.17,-40},{-80,-40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(qCon.heaPor_a, capHea.heaPor) annotation (Line(
      points={{-60,0},{0,0},{0,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(qRad.heaPor_a, capHea.heaPor) annotation (Line(
      points={{-60,-40},{0,-40},{0,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(expQCon.y, qCon.QSet) annotation (Line(
      points={{-61,20},{-70,20},{-70,10.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(expQRad.y, qRad.QSet) annotation (Line(
      points={{-61,-20},{-70,-20},{-70,-29.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heaPorEmb, qEmb.port) annotation (Line(
      points={{-100.614,40.944},{-90,40.944},{-90,46},{-80,46}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}}),                                                                                                    graphics));
end HVAC_KK;
