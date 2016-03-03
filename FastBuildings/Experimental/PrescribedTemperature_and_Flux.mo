within FastBuildings.Experimental;

model PrescribedTemperature_and_Flux "Variable temperature and flux boundary condition "
  HT.Interfaces.HeatPort_b port annotation(Placement(transformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput T(unit = "K") annotation(Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
  //Modelica.Blocks.Interfaces.RealInput Q(unit="W") annotation (Placement(
  //      transformation(extent={{-140,-58},{-100,-18}}, rotation=0)));
equation
  port.T = T;
  annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillColor = {159, 159, 223}, fillPattern = FillPattern.Backward), Line(points = {{-102, 0}, {64, 0}}, color = {191, 0, 0}, thickness = 0.5), Text(extent = {{0, 0}, {-100, -100}}, lineColor = {0, 0, 0}, textString = "K"), Text(extent = {{-150, 150}, {150, 110}}, textString = "%name", lineColor = {0, 0, 255}), Polygon(points = {{50, -20}, {50, 20}, {90, 0}, {50, -20}}, lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid)}), Documentation(info = "<HTML>
<p>
This model represents a variable temperature boundary condition.
The temperature in [K] is given as input signal <b>T</b>
to the model. The effect is that an instance of this model acts as
an infinite reservoir able to absorb or generate as much energy
as required to keep the temperature at the specified value.
</p>
</html>"), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillColor = {159, 159, 223}, fillPattern = FillPattern.Backward), Text(extent = {{0, 0}, {-100, -100}}, lineColor = {0, 0, 0}, textString = "K")}));
end PrescribedTemperature_and_Flux;