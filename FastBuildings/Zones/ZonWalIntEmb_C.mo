within FastBuildings.Zones;
model ZonWalIntEmb_C "Adding ground"
  extends ZonWalIntEmb_B;
  extends FastBuildings.Zones.BaseClasses.Partials.Partial_Ground;
equation
  connect(resGro.heaPor_a, senTZon.port) annotation (Line(
      points={{-20,-80},{50,-80}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{100,100}}), graphics));
end ZonWalIntEmb_C;
