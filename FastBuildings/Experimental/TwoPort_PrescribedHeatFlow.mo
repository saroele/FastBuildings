within FastBuildings.Experimental;
model TwoPort_PrescribedHeatFlow "Prescribed heat flow as twoport"

  HT.Interfaces.HeatPort_a heaPor_a annotation(Placement(transformation(extent={{-110,
            -10},{-90,10}},                                                                             rotation = 0),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  HT.Interfaces.HeatPort_b heaPor_b annotation(Placement(transformation(extent={{90,-10},
            {110,10}},                                                                                rotation = 0),
        iconTransformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealInput QSet "Heat flow input, from a to b"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,106})));
equation

  heaPor_a.Q_flow = QSet;
  heaPor_b.Q_flow = -QSet;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Polygon(
          points={{-10,40},{0,0},{10,40},{-10,40}},
          lineColor={0,0,255},
          lineThickness=0.5,
          smooth=Smooth.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-10,20},{0,-20},{10,20},{-10,20}},
          lineColor={0,0,255},
          lineThickness=0.5,
          smooth=Smooth.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          origin={68,0},
          rotation=90),
        Line(
          points={{-80,0},{62,0},{80,0}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.None),
        Line(
          points={{0,80},{0,22}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None)}));
end TwoPort_PrescribedHeatFlow;
