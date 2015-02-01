within FastBuildings.Experimental;
model ThemalSplitter
  "Splits one or multiple heat flows into embedded, radiative and convective based on parameters"
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";
   HT.Interfaces.HeatPort_a heaPorRad annotation(Placement(visible = true, transformation(origin = {-100.17,-40}, extent = {{-12,-12},{12,12}}, rotation = 0), iconTransformation(origin = {-100.17,-40}, extent = {{-12,-12},{12,12}}, rotation = 0)));
   HT.Interfaces.HeatPort_a heaPorCon annotation(Placement(visible = true, transformation(origin = {-99.83,0.0682}, extent = {{-12,-12},{12,12}}, rotation = 0), iconTransformation(origin = {-99.83,0.0682}, extent = {{-12,-12},{12,12}}, rotation = 0)));
   HT.Interfaces.HeatPort_b heaPorEmb annotation(Placement(visible = true, transformation(origin = {-100.614,40.944}, extent = {{-12,-12},{12,12}}, rotation = 0), iconTransformation(origin = {-99.83,39.9318}, extent = {{-12,-12},{12,12}}, rotation = 0)));
   HT.Interfaces.HeatPort_a heaPorTot "Total heat to be splitted" annotation (
      Placement(
      visible=true,
      transformation(
        origin={100.17,0.0682},
        extent={{-12,-12},{12,12}},
        rotation=0),
      iconTransformation(
        origin={100.17,-1.9318},
        extent={{-12,-12},{12,12}},
        rotation=0)));
  HT.Sources.PrescribedHeatFlow preQCon
    annotation (Placement(transformation(extent={{-40,-10},{-60,10}})));
  HT.Sources.PrescribedHeatFlow preQRad
    annotation (Placement(transformation(extent={{-40,-50},{-60,-30}})));
  HT.Sources.PrescribedHeatFlow preQEmb
    annotation (Placement(transformation(extent={{-40,30},{-60,50}})));
  HT.Sources.FixedTemperature preT(T=273.15) "Grounding for temparature"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={58,0})));
  Modelica.Blocks.Sources.RealExpression expQEmb
    annotation (Placement(transformation(extent={{0,30},{-20,50}})));
  Modelica.Blocks.Sources.RealExpression expQRad(y=fraRad*heaPorTot.Q_flow)
    annotation (Placement(transformation(extent={{26,-50},{-20,-30}})));
  Modelica.Blocks.Sources.RealExpression expQCon(y=(1 - fraRad)*heaPorTot.Q_flow)
    annotation (Placement(transformation(extent={{26,-10},{-20,10}})));
equation
  connect(heaPorCon, preQCon.port) annotation (Line(
      points={{-99.83,0.0682},{-80,0.0682},{-80,0},{-60,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preQRad.port, heaPorRad) annotation (Line(
      points={{-60,-40},{-100.17,-40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preQEmb.port, heaPorEmb) annotation (Line(
      points={{-60,40},{-80,40},{-80,40.944},{-100.614,40.944}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heaPorTot, preT.port) annotation (Line(
      points={{100.17,0.0682},{84,0.0682},{84,0},{68,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preQEmb.Q_flow, expQEmb.y) annotation (Line(
      points={{-40,40},{-21,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(preQCon.Q_flow, expQCon.y) annotation (Line(
      points={{-40,0},{-22.3,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(preQRad.Q_flow, expQRad.y) annotation (Line(
      points={{-40,-40},{-22.3,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end ThemalSplitter;
