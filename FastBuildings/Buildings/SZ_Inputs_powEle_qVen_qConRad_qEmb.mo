within FastBuildings.Buildings;

model SZ_Inputs_powEle_qVen_qConRad_qEmb
  extends SZ_Inputs_with_partials(redeclare replaceable FastBuildings.HVAC.Heating_qConRad_qEmb hva);
  replaceable HVAC.Ventilation_Profile ven annotation(Placement(visible = true, transformation(origin = {14, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(zon.TZon, ven.TZon) annotation(Line(points = {{-22, -8}, {-4, -8}, {-4, 22}, {4, 22}, {4, 22}}, color = {0, 0, 127}));
  connect(zon.heaPorCon, ven.heaPorCon) annotation(Line(points = {{-22, 0}, {-8, 0}, {-8, 30}, {4, 30}, {4, 30}}, color = {191, 0, 0}));
end SZ_Inputs_powEle_qVen_qConRad_qEmb;