within FastBuildings.HVAC;
model Heating_TSup_B
  "Heating based on supply temperature TSup and linear heat transfer coefficient"

  extends Partial_HVAC;
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";
  // Heat emission heat transfer coefficient h = h0 + h1*(TSet-TZon)
  // TSet is a parameter (can be fix or free)
  parameter SI.Temperature TSet = 273.15+22
    "Constant set temperature for internal control of heat emission system";
  parameter Real h0 "Intercept of heat transfer coefficient of emission system";
  parameter Real h1
    "1st order coeff of heat transfer coefficient of emission system";
  SI.Power qHeaCoo "Total heating power";
  SI.ThermalResistance rHea
    "Resulting thermal resistance of the emission system";

  outer Input.BaseClasses.Partial_SIM simFasBui
    "Weather and input data, to be provided by an inner submodel of Partial_SIM"
                                                                                                        annotation(Placement(visible = true, transformation(origin={-90.1538,
            89.5214},                                                                                                    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  1/rHea = h0 + h1*(TSet - TZon);
  qHeaCoo * rHea = (simFasBui.TSet - TZon);

  heaPorCon.Q_flow = -(1 - fraRad) * qHeaCoo;
  heaPorRad.Q_flow = -fraRad * qHeaCoo;
  heaPorEmb.Q_flow = 0;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));

end Heating_TSup_B;
