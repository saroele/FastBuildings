within FastBuildings.Experimental;
model Heating_TSup_A
  "Heating based on supply temperature TSup and fixed heat transfer coefficient"

  extends HVAC.Partial_HVAC;
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";
  parameter Real rHea=1e-2
    "Fixed heat transfer coefficient of heat emission system";
  SI.Power qHeaCoo "Total heating power";

  outer Input.BaseClasses.Partial_SIM simFasBui
    "Weather and input data, to be provided by an inner submodel of Partial_SIM"
                                                                                                        annotation(Placement(visible = true, transformation(origin={-90.1538,
            89.5214},                                                                                                    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

  qHeaCoo = (simFasBui.TSet - TZon) / rHea;

  heaPorCon.Q_flow = -(1 - fraRad) * qHeaCoo;
  heaPorRad.Q_flow = -fraRad * qHeaCoo;
  heaPorEmb.Q_flow = 0;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Heating_TSup_A;
