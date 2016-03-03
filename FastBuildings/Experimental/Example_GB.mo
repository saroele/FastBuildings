within FastBuildings.Experimental;

model Example_GB
  extends Modelica.Icons.Example;
  GB_QSet_ConstantEta gB_QSet_ConstantEta annotation(Placement(transformation(extent = {{4, 6}, {24, 26}})));
  inner Input.SIM_ArtificialInput simFasBui annotation(Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
equation
  connect(simFasBui.qHeaCoo, gB_QSet_ConstantEta.QSet) annotation(Line(points = {{-82.0392, 79.0248}, {-82.0392, 22}, {3.4, 22}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end Example_GB;