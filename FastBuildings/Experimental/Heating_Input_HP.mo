within FastBuildings.Experimental;
model Heating_Input_HP
  "Heating only, heating power read from input, with Heat Pump"
  extends HVAC.Partial_HVAC;
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";
  Modelica.Blocks.Interfaces.RealInput qHeaCoo "total heating/cooling input" annotation(Placement(visible = true, transformation(origin = {-100.259,80.3748}, extent = {{-12,-12},{12,12}}, rotation = 0), iconTransformation(origin = {-100.259,80.3748}, extent = {{-12,-12},{12,12}}, rotation = 0)));
  HP_AW_QSet_ConstantCOP hp
    annotation (Placement(transformation(extent={{-30,92},{30,34}})));
equation
  heaPorCon.Q_flow = -(1 - fraRad) * qHeaCoo;
  heaPorRad.Q_flow = -fraRad * qHeaCoo;
  heaPorEmb.Q_flow = 0;
  connect(qHeaCoo, hp.QSet) annotation (Line(
      points={{-100.259,80.3748},{-46,80.3748},{-46,80.4},{-31.8,80.4}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}}),                                                                                                    graphics));
end Heating_Input_HP;
