within FastBuildings.HVAC;
model Ventilation_Profile
  "Fixed flowrate ventilation based on a profile from simFasBui"

HT.Interfaces.HeatPort_a heaPorCon annotation(Placement(visible = true, transformation(origin = {-99.83,0.0682}, extent = {{-12,-12},{12,12}}, rotation = 0), iconTransformation(origin = {-99.83,0.0682}, extent = {{-12,-12},{12,12}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput TZon annotation(Placement(visible = true, transformation(origin={-103.578,
            -60.3407},                                                                                                    extent = {{-12,-12},{12,12}}, rotation = 0), iconTransformation(origin={-103.578,
            -80.3407},                                                                                                    extent = {{-12,-12},{12,12}}, rotation = 0)));

   outer Input.BaseClasses.Partial_SIM simFasBui
    "Weather and input data, to be provided by an inner submodel of Partial_SIM"
    annotation(Placement(visible = true, transformation(origin={-90.1538,
               89.5214}, extent = {{-10,-10},{10,10}}, rotation = 0)));

  parameter SI.MassFlowRate mFloVen=0 "Ventilation mass flow rate";
  parameter Integer nPrf=1 "Profile to be used for ventilation";
  parameter SI.SpecificHeatCapacity cpAir=1012
    "Specific heat of air, room conditions";

equation
  heaPorCon.Q_flow = simFasBui.prf[nPrf]*mFloVen*cpAir*(simFasBui.TAmb-TZon);

            annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(rotation = 0, lineColor = {0,0,255}, fillColor = {0,0,255}, pattern = LinePattern.Solid,
            fillPattern =                                                                                                   FillPattern.None,
            lineThickness =                                                                                                   0.25, extent = {{-99.4889,99.4889},{100.17,-100.511}}),Text(rotation = 0, lineColor = {0,0,255}, fillColor = {0,0,255}, pattern = LinePattern.Solid,
            fillPattern =                                                                                                   FillPattern.None,
            lineThickness =                                                                                                   0.25, extent = {{-74.276,28.6201},{73.5945,-24.8722}}, textString = "ventilation")}));

end Ventilation_Profile;
