within FastBuildings.Buildings;


model SZ_Inputs_powEle_Ventilation
  "Single zone building, with HVAC and internal gains all read from inputs"
  extends FastBuildings.Buildings.BaseClasses.PartialSingleZone(redeclare
      FastBuildings.HVAC.Heating_Input                                                                     hva);
  replaceable FastBuildings.Users.powEleFra use annotation(Placement(visible = true, transformation(origin = {-27.6923, -40.6838}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HVAC.Ventilation_Profile ventilation_Profile(mFloVen = 0.5) annotation(Placement(transformation(extent = {{8, 24}, {28, 44}})));
equation
  connect(simFasBui.powEle, use.powEle) annotation(Line(points={{-86.193,
          78.5462},{-86,78.5462},{-86,-40},{-38.3051,-40},{-38.3051,-40.6577}}));
  connect(use.heaPorRad, zon.heaPorRad) annotation(Line(points={{-17.7053,
          -44.6473},{-5.47009,-44.6473},{-5.47009,-4.10256},{-19.0598,-4.10256},
          {-19.0598,-3.65812}}));
  connect(use.heaPorCon, zon.heaPorCon) annotation(Line(points={{-17.6793,
          -36.6942},{-7.86325,-36.6942},{-7.86325,0.683761},{-18.4615,0.683761},
          {-18.4615,0.34188},{-19.0598,0.34188}}));
  connect(zon.TZon, ventilation_Profile.TZon) annotation(Line(points={{-19.0598,
          -7.65812},{-19.0598,-8},{0,-8},{0,26},{7.6422,26},{7.6422,25.9659}},                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(zon.heaPorCon, ventilation_Profile.heaPorCon) annotation(Line(points={{
          -19.0598,0.34188},{-6,0.34188},{-6,34},{8.017,34},{8.017,34.0068}},                                                                                                    color = {191, 0, 0}, smooth = Smooth.None));
  connect(simFasBui.qHeaCoo, hva.qHeaCoo) annotation(Line(points={{-82.193,
          78.5462},{-82.193,58},{48,58},{48,16},{2,16},{2,8.72124},{8.0938,
          8.72124}},                                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics));
end SZ_Inputs_powEle_Ventilation;
