within FastBuildings.Experimental;
partial model Partial_HeatProduction "Partial for heat production"
  HT.Interfaces.HeatPort_a heaPorHot annotation(Placement(visible = true, transformation(origin={-99.83,
            0.0682},                                                                                                extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-99.83, 0.0682}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  outer Input.BaseClasses.Partial_SIM simFasBui
    "Weather and input data, to be provided by an inner submodel of Partial_SIM"
                                                                                                        annotation(Placement(visible = true, transformation(origin={-90.1538,
            89.5214},                                                                                                    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PEle
    annotation (Placement(transformation(extent={{96,30},{116,50}})));
  Modelica.Blocks.Interfaces.RealOutput PFuel
    annotation (Placement(transformation(extent={{96,-50},{116,-30}})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Partial_HeatProduction;
