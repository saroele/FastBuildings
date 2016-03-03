within FastBuildings.Users;

model powEle_Occ "Separate inputs for electricity consumption(in W) and occupancy profile (0-1)"
  parameter Real fraCon = 0.7 "Fraction of electrical power and metabolic gains that is converted in convective heat";
  parameter Real nOcc = 1 "Number of occupants at full occupancy (when pfrOcc=1)";
  parameter SI.HeatFlowRate metabolism = 100 "Total sensitive heat gain per person";
  final parameter Real fraRad = 1 - fraCon "Fraction of PUsers that is converted in radiative heat";
  Modelica.Blocks.Interfaces.RealInput powEle annotation(Placement(visible = true, transformation(origin = {-106.128, 0.260756}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-106.128, 0.260756}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorCon annotation(Placement(visible = true, transformation(origin = {100.13, 39.8957}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {100.13, 39.8957}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorRad annotation(Placement(visible = true, transformation(origin = {99.8696, -39.6349}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {99.8696, -39.6349}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput prfOcc annotation(Placement(visible = true, transformation(origin = {-106.128, 60.2608}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-106.128, 0.260756}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  SI.HeatFlowRate QOcc;
equation
  QOcc = nOcc * metabolism * prfOcc;
  heaPorCon.Q_flow = -(powEle + QOcc) * fraCon;
  heaPorRad.Q_flow = -(powEle + QOcc) * fraRad;
  annotation(Icon, Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end powEle_Occ;