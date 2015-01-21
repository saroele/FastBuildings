within FastBuildings.Buildings;
model SZ_Inputs
  extends FastBuildings.Buildings.BaseClasses.PartialSingleZone(redeclare
      FastBuildings.HVAC.Heating_Input                                                                     hva);
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2,2}), graphics));
end SZ_Inputs;
