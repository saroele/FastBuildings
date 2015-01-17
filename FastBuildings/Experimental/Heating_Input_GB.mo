within FastBuildings.Experimental;
model Heating_Input_GB "Heating only, heating power read from input, with GB"
  extends HVAC.Partial_HVAC;
  parameter Real fraRad = 0.3 "Fraction of heating to radiation";

  Modelica.Blocks.Interfaces.RealInput qHeaCoo "total heating/cooling input" annotation(Placement(visible = true, transformation(origin = {-100.259,80.3748}, extent = {{-12,-12},{12,12}}, rotation = 0), iconTransformation(origin = {-100.259,80.3748}, extent = {{-12,-12},{12,12}}, rotation = 0)));
  GB_QSet_ConstantEta gb
    annotation (Placement(transformation(extent={{20,92},{80,34}})));
equation
  heaPorCon.Q_flow = (1 - fraRad) * gb.heaPorHot.Q_flow;
  heaPorRad.Q_flow = fraRad * gb.heaPorHot.Q_flow;
  heaPorEmb.Q_flow = 0;
  connect(qHeaCoo, gb.QSet) annotation (Line(
      points={{-100.259,80.3748},{-46,80.3748},{-46,80.4},{18.2,80.4}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}}),                                                                                                    graphics));
end Heating_Input_GB;
