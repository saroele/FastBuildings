within FastBuildings.Experimental;
model KK
  "Single zone building, with HVAC and internal gains all read from inputs"
  extends FastBuildings.Buildings.BaseClasses.PartialSingleZone(
    redeclare replaceable Heating_Input_KK  hva);
  replaceable FastBuildings.Users.powEleFra_Occ use  annotation(Placement(visible = true, transformation(origin = {-27.6923,-40.6838}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Ventilation_Profile ven
    annotation (Placement(transformation(extent={{6,26},{26,46}})));
equation
  connect(simFasBui.powEle,use.powEle) annotation(Line(points={{-86.193,78.5462},
          {-81.0256,78.5462},{-81.0256,-40.6838},{-38.3051,-40.6838},{-38.3051,
          -40.6577}}));
  connect(use.heaPorRad,zon.heaPorRad) annotation(Line(points={{-17.7053,
          -44.6473},{-5.47009,-44.6473},{-5.47009,-4.10256},{-19.0598,-4.10256},
          {-19.0598,-3.65812}}));
  connect(use.heaPorCon,zon.heaPorCon) annotation(Line(points={{-17.6793,
          -36.6942},{-7.86325,-36.6942},{-7.86325,0.683761},{-18.4615,0.683761},
          {-18.4615,0.34188},{-19.0598,0.34188}}));
  connect(ven.heaPorCon, hva.heaPorCon) annotation (Line(
      points={{6.017,36.0068},{-4,36.0068},{-4,0},{8.20513,0},{8.20513,0.690581},
          {8.1367,0.690581}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(zon.TZon, ven.TZon) annotation (Line(
      points={{-19.0598,-7.65812},{-20,-7.65812},{-20,-8},{0,-8},{0,27.9659},{
          5.6422,27.9659}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent={{-100,
            -100},{100,100}},                                                                                                    preserveAspectRatio=false,   initialScale = 0.1, grid = {2,2}), graphics));
end KK;
