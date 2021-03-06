import("stdfaust.lib");

/* Faust PM Workshop : Introduction to Mass-Interaction Modelling */
/* Part 11: A larger bowed string model */

in1 = hslider("Bow Position", 0, -300, 300, 0.001):si.smoo:si.smoo:si.smoo:si.smoo; 	//write a specific position input signal operation here
in2 = hslider("Finger Position", 1, -1, 1, 0.001):si.smoo; 	//write a specific position input signal operation here

OutGain = 0.6;

nlZ = hslider("Bow Pressure", 0, 0, 1, 0.01);
nlscale = 0.02;
str_M = 1.0;
str_K = 0.7;
str_Z = 0.001;
str_Zo = 0.0;

model = (
	par(i, nbMass - nbPosIn, _), ro.interleave(nbPosIn, 2):
	mi.ground(0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.oscil(str_M, 0, str_Zo, 0, 0.00, 0.00),
	mi.ground(0.00),
	mi.posInput(0),
	mi.posInput(0):
	RoutingMassToLink :
	mi.nlBow(nlZ, nlscale, 1, 0, 0.00),
	mi.nlBow(nlZ, nlscale, 1, 0, 0.00),
	mi.collision(0.1, 0.01, 0, 0.00, 0),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	mi.springDamper(str_K, str_Z, 0.00, 0.00),
	par(i, nbOut, _):
	RoutingLinkToMass
)~par(i, nbMass, _):
par(i, nbMass, !), par(i, nbOut , _)
with{
	RoutingMassToLink(m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16, m17, m18, m19, m20, m21, m22, m23, m24, m25, m26, m27, m28, m29, m30, m31, m32, m33, m34, m35, m36, m37, m38, m39, m40, m41, m42, m43, m44, m45, m46, m47, m48, m49, m50, m51, m52, m53, m54, m55, m56, m57, m58, m59, m60, m61, m62, m63, m64, m65, m66, m67, m68, m69, m70, m71, m72, m73, m74, m75, m76, m77, m78, m79, m80, m81, m82, m83, m84, m85, m86, m87, m88, m89, m90, m91, m92, m93, m94, m95, m96, m97, m98, m99, m100, m101, m102, m103, m104, m105, m106, m107, m108, m109, m110, m111, m112, m113, m114, m115, m116, m117, m118, m119, m120, m121, m122, m123, m124, m125, m126, m127, m128, m129, m130, m131, m132, m133, m134, m135, m136, m137, m138, m139, m140, m141, m142, m143, m144, m145, m146, m147, m148, m149, m150, m151, m152, m153, m154, m155, m156, m157, m158, m159, m160, m161, m162, m163, m164, m165, m166, m167, m168, m169, m170, m171, m172, m173, m174, m175, m176, m177, m178, m179, m180, m181, m182, m183, m184, m185, m186, m187, m188, m189, m190, m191, m192, m193, m194, m195, m196, m197, m198, m199, m200, m201, m202, m203, m204, m205, m206, m207, m208, m209, m210, m211, m212, m213, m214, m215, m216, m217, m218, m219, m220, m221, m222, m223, m224, m225, m226, m227, m228, m229, m230, m231, m232, m233) = /* routed positions */ m232, m39, m232, m40, m116, m233, m0, m1, m1, m2, m2, m3, m3, m4, m4, m5, m5, m6, m6, m7, m7, m8, m8, m9, m9, m10, m10, m11, m11, m12, m12, m13, m13, m14, m14, m15, m15, m16, m16, m17, m17, m18, m18, m19, m19, m20, m20, m21, m21, m22, m22, m23, m23, m24, m24, m25, m25, m26, m26, m27, m27, m28, m28, m29, m29, m30, m30, m31, m31, m32, m32, m33, m33, m34, m34, m35, m35, m36, m36, m37, m37, m38, m38, m39, m39, m40, m40, m41, m41, m42, m42, m43, m43, m44, m44, m45, m45, m46, m46, m47, m47, m48, m48, m49, m49, m50, m50, m51, m51, m52, m52, m53, m53, m54, m54, m55, m55, m56, m56, m57, m57, m58, m58, m59, m59, m60, m60, m61, m61, m62, m62, m63, m63, m64, m64, m65, m65, m66, m66, m67, m67, m68, m68, m69, m69, m70, m70, m71, m71, m72, m72, m73, m73, m74, m74, m75, m75, m76, m76, m77, m77, m78, m78, m79, m79, m80, m80, m81, m81, m82, m82, m83, m83, m84, m84, m85, m85, m86, m86, m87, m87, m88, m88, m89, m89, m90, m90, m91, m91, m92, m92, m93, m93, m94, m94, m95, m95, m96, m96, m97, m97, m98, m98, m99, m99, m100, m100, m101, m101, m102, m102, m103, m103, m104, m104, m105, m105, m106, m106, m107, m107, m108, m108, m109, m109, m110, m110, m111, m111, m112, m112, m113, m113, m114, m114, m115, m115, m116, m116, m117, m117, m118, m118, m119, m119, m120, m120, m121, m121, m122, m122, m123, m123, m124, m124, m125, m125, m126, m126, m127, m127, m128, m128, m129, m129, m130, m130, m131, m131, m132, m132, m133, m133, m134, m134, m135, m135, m136, m136, m137, m137, m138, m138, m139, m139, m140, m140, m141, m141, m142, m142, m143, m143, m144, m144, m145, m145, m146, m146, m147, m147, m148, m148, m149, m149, m150, m150, m151, m151, m152, m152, m153, m153, m154, m154, m155, m155, m156, m156, m157, m157, m158, m158, m159, m159, m160, m160, m161, m161, m162, m162, m163, m163, m164, m164, m165, m165, m166, m166, m167, m167, m168, m168, m169, m169, m170, m170, m171, m171, m172, m172, m173, m173, m174, m174, m175, m175, m176, m176, m177, m177, m178, m178, m179, m179, m180, m180, m181, m181, m182, m182, m183, m183, m184, m184, m185, m185, m186, m186, m187, m187, m188, m188, m189, m189, m190, m190, m191, m191, m192, m192, m193, m193, m194, m194, m195, m195, m196, m196, m197, m197, m198, m198, m199, m199, m200, m200, m201, m201, m202, m202, m203, m203, m204, m204, m205, m205, m206, m206, m207, m207, m208, m208, m209, m209, m210, m210, m211, m211, m212, m212, m213, m213, m214, m214, m215, m215, m216, m216, m217, m217, m218, m218, m219, m219, m220, m220, m221, m221, m222, m222, m223, m223, m224, m224, m225, m225, m226, m226, m227, m227, m228, m228, m229, m229, m230, m230, m231, /* outputs */ m28, m4;
	RoutingLinkToMass(l0_f1, l0_f2, l1_f1, l1_f2, l2_f1, l2_f2, l3_f1, l3_f2, l4_f1, l4_f2, l5_f1, l5_f2, l6_f1, l6_f2, l7_f1, l7_f2, l8_f1, l8_f2, l9_f1, l9_f2, l10_f1, l10_f2, l11_f1, l11_f2, l12_f1, l12_f2, l13_f1, l13_f2, l14_f1, l14_f2, l15_f1, l15_f2, l16_f1, l16_f2, l17_f1, l17_f2, l18_f1, l18_f2, l19_f1, l19_f2, l20_f1, l20_f2, l21_f1, l21_f2, l22_f1, l22_f2, l23_f1, l23_f2, l24_f1, l24_f2, l25_f1, l25_f2, l26_f1, l26_f2, l27_f1, l27_f2, l28_f1, l28_f2, l29_f1, l29_f2, l30_f1, l30_f2, l31_f1, l31_f2, l32_f1, l32_f2, l33_f1, l33_f2, l34_f1, l34_f2, l35_f1, l35_f2, l36_f1, l36_f2, l37_f1, l37_f2, l38_f1, l38_f2, l39_f1, l39_f2, l40_f1, l40_f2, l41_f1, l41_f2, l42_f1, l42_f2, l43_f1, l43_f2, l44_f1, l44_f2, l45_f1, l45_f2, l46_f1, l46_f2, l47_f1, l47_f2, l48_f1, l48_f2, l49_f1, l49_f2, l50_f1, l50_f2, l51_f1, l51_f2, l52_f1, l52_f2, l53_f1, l53_f2, l54_f1, l54_f2, l55_f1, l55_f2, l56_f1, l56_f2, l57_f1, l57_f2, l58_f1, l58_f2, l59_f1, l59_f2, l60_f1, l60_f2, l61_f1, l61_f2, l62_f1, l62_f2, l63_f1, l63_f2, l64_f1, l64_f2, l65_f1, l65_f2, l66_f1, l66_f2, l67_f1, l67_f2, l68_f1, l68_f2, l69_f1, l69_f2, l70_f1, l70_f2, l71_f1, l71_f2, l72_f1, l72_f2, l73_f1, l73_f2, l74_f1, l74_f2, l75_f1, l75_f2, l76_f1, l76_f2, l77_f1, l77_f2, l78_f1, l78_f2, l79_f1, l79_f2, l80_f1, l80_f2, l81_f1, l81_f2, l82_f1, l82_f2, l83_f1, l83_f2, l84_f1, l84_f2, l85_f1, l85_f2, l86_f1, l86_f2, l87_f1, l87_f2, l88_f1, l88_f2, l89_f1, l89_f2, l90_f1, l90_f2, l91_f1, l91_f2, l92_f1, l92_f2, l93_f1, l93_f2, l94_f1, l94_f2, l95_f1, l95_f2, l96_f1, l96_f2, l97_f1, l97_f2, l98_f1, l98_f2, l99_f1, l99_f2, l100_f1, l100_f2, l101_f1, l101_f2, l102_f1, l102_f2, l103_f1, l103_f2, l104_f1, l104_f2, l105_f1, l105_f2, l106_f1, l106_f2, l107_f1, l107_f2, l108_f1, l108_f2, l109_f1, l109_f2, l110_f1, l110_f2, l111_f1, l111_f2, l112_f1, l112_f2, l113_f1, l113_f2, l114_f1, l114_f2, l115_f1, l115_f2, l116_f1, l116_f2, l117_f1, l117_f2, l118_f1, l118_f2, l119_f1, l119_f2, l120_f1, l120_f2, l121_f1, l121_f2, l122_f1, l122_f2, l123_f1, l123_f2, l124_f1, l124_f2, l125_f1, l125_f2, l126_f1, l126_f2, l127_f1, l127_f2, l128_f1, l128_f2, l129_f1, l129_f2, l130_f1, l130_f2, l131_f1, l131_f2, l132_f1, l132_f2, l133_f1, l133_f2, l134_f1, l134_f2, l135_f1, l135_f2, l136_f1, l136_f2, l137_f1, l137_f2, l138_f1, l138_f2, l139_f1, l139_f2, l140_f1, l140_f2, l141_f1, l141_f2, l142_f1, l142_f2, l143_f1, l143_f2, l144_f1, l144_f2, l145_f1, l145_f2, l146_f1, l146_f2, l147_f1, l147_f2, l148_f1, l148_f2, l149_f1, l149_f2, l150_f1, l150_f2, l151_f1, l151_f2, l152_f1, l152_f2, l153_f1, l153_f2, l154_f1, l154_f2, l155_f1, l155_f2, l156_f1, l156_f2, l157_f1, l157_f2, l158_f1, l158_f2, l159_f1, l159_f2, l160_f1, l160_f2, l161_f1, l161_f2, l162_f1, l162_f2, l163_f1, l163_f2, l164_f1, l164_f2, l165_f1, l165_f2, l166_f1, l166_f2, l167_f1, l167_f2, l168_f1, l168_f2, l169_f1, l169_f2, l170_f1, l170_f2, l171_f1, l171_f2, l172_f1, l172_f2, l173_f1, l173_f2, l174_f1, l174_f2, l175_f1, l175_f2, l176_f1, l176_f2, l177_f1, l177_f2, l178_f1, l178_f2, l179_f1, l179_f2, l180_f1, l180_f2, l181_f1, l181_f2, l182_f1, l182_f2, l183_f1, l183_f2, l184_f1, l184_f2, l185_f1, l185_f2, l186_f1, l186_f2, l187_f1, l187_f2, l188_f1, l188_f2, l189_f1, l189_f2, l190_f1, l190_f2, l191_f1, l191_f2, l192_f1, l192_f2, l193_f1, l193_f2, l194_f1, l194_f2, l195_f1, l195_f2, l196_f1, l196_f2, l197_f1, l197_f2, l198_f1, l198_f2, l199_f1, l199_f2, l200_f1, l200_f2, l201_f1, l201_f2, l202_f1, l202_f2, l203_f1, l203_f2, l204_f1, l204_f2, l205_f1, l205_f2, l206_f1, l206_f2, l207_f1, l207_f2, l208_f1, l208_f2, l209_f1, l209_f2, l210_f1, l210_f2, l211_f1, l211_f2, l212_f1, l212_f2, l213_f1, l213_f2, l214_f1, l214_f2, l215_f1, l215_f2, l216_f1, l216_f2, l217_f1, l217_f2, l218_f1, l218_f2, l219_f1, l219_f2, l220_f1, l220_f2, l221_f1, l221_f2, l222_f1, l222_f2, l223_f1, l223_f2, l224_f1, l224_f2, l225_f1, l225_f2, l226_f1, l226_f2, l227_f1, l227_f2, l228_f1, l228_f2, l229_f1, l229_f2, l230_f1, l230_f2, l231_f1, l231_f2, l232_f1, l232_f2, l233_f1, l233_f2, p_out1, p_out2) = /* routed forces  */ l3_f1, l3_f2 + l4_f1, l4_f2 + l5_f1, l5_f2 + l6_f1, l6_f2 + l7_f1, l7_f2 + l8_f1, l8_f2 + l9_f1, l9_f2 + l10_f1, l10_f2 + l11_f1, l11_f2 + l12_f1, l12_f2 + l13_f1, l13_f2 + l14_f1, l14_f2 + l15_f1, l15_f2 + l16_f1, l16_f2 + l17_f1, l17_f2 + l18_f1, l18_f2 + l19_f1, l19_f2 + l20_f1, l20_f2 + l21_f1, l21_f2 + l22_f1, l22_f2 + l23_f1, l23_f2 + l24_f1, l24_f2 + l25_f1, l25_f2 + l26_f1, l26_f2 + l27_f1, l27_f2 + l28_f1, l28_f2 + l29_f1, l29_f2 + l30_f1, l30_f2 + l31_f1, l31_f2 + l32_f1, l32_f2 + l33_f1, l33_f2 + l34_f1, l34_f2 + l35_f1, l35_f2 + l36_f1, l36_f2 + l37_f1, l37_f2 + l38_f1, l38_f2 + l39_f1, l39_f2 + l40_f1, l40_f2 + l41_f1, l0_f2 + l41_f2 + l42_f1, l1_f2 + l42_f2 + l43_f1, l43_f2 + l44_f1, l44_f2 + l45_f1, l45_f2 + l46_f1, l46_f2 + l47_f1, l47_f2 + l48_f1, l48_f2 + l49_f1, l49_f2 + l50_f1, l50_f2 + l51_f1, l51_f2 + l52_f1, l52_f2 + l53_f1, l53_f2 + l54_f1, l54_f2 + l55_f1, l55_f2 + l56_f1, l56_f2 + l57_f1, l57_f2 + l58_f1, l58_f2 + l59_f1, l59_f2 + l60_f1, l60_f2 + l61_f1, l61_f2 + l62_f1, l62_f2 + l63_f1, l63_f2 + l64_f1, l64_f2 + l65_f1, l65_f2 + l66_f1, l66_f2 + l67_f1, l67_f2 + l68_f1, l68_f2 + l69_f1, l69_f2 + l70_f1, l70_f2 + l71_f1, l71_f2 + l72_f1, l72_f2 + l73_f1, l73_f2 + l74_f1, l74_f2 + l75_f1, l75_f2 + l76_f1, l76_f2 + l77_f1, l77_f2 + l78_f1, l78_f2 + l79_f1, l79_f2 + l80_f1, l80_f2 + l81_f1, l81_f2 + l82_f1, l82_f2 + l83_f1, l83_f2 + l84_f1, l84_f2 + l85_f1, l85_f2 + l86_f1, l86_f2 + l87_f1, l87_f2 + l88_f1, l88_f2 + l89_f1, l89_f2 + l90_f1, l90_f2 + l91_f1, l91_f2 + l92_f1, l92_f2 + l93_f1, l93_f2 + l94_f1, l94_f2 + l95_f1, l95_f2 + l96_f1, l96_f2 + l97_f1, l97_f2 + l98_f1, l98_f2 + l99_f1, l99_f2 + l100_f1, l100_f2 + l101_f1, l101_f2 + l102_f1, l102_f2 + l103_f1, l103_f2 + l104_f1, l104_f2 + l105_f1, l105_f2 + l106_f1, l106_f2 + l107_f1, l107_f2 + l108_f1, l108_f2 + l109_f1, l109_f2 + l110_f1, l110_f2 + l111_f1, l111_f2 + l112_f1, l112_f2 + l113_f1, l113_f2 + l114_f1, l114_f2 + l115_f1, l115_f2 + l116_f1, l116_f2 + l117_f1, l117_f2 + l118_f1, l2_f1 + l118_f2 + l119_f1, l119_f2 + l120_f1, l120_f2 + l121_f1, l121_f2 + l122_f1, l122_f2 + l123_f1, l123_f2 + l124_f1, l124_f2 + l125_f1, l125_f2 + l126_f1, l126_f2 + l127_f1, l127_f2 + l128_f1, l128_f2 + l129_f1, l129_f2 + l130_f1, l130_f2 + l131_f1, l131_f2 + l132_f1, l132_f2 + l133_f1, l133_f2 + l134_f1, l134_f2 + l135_f1, l135_f2 + l136_f1, l136_f2 + l137_f1, l137_f2 + l138_f1, l138_f2 + l139_f1, l139_f2 + l140_f1, l140_f2 + l141_f1, l141_f2 + l142_f1, l142_f2 + l143_f1, l143_f2 + l144_f1, l144_f2 + l145_f1, l145_f2 + l146_f1, l146_f2 + l147_f1, l147_f2 + l148_f1, l148_f2 + l149_f1, l149_f2 + l150_f1, l150_f2 + l151_f1, l151_f2 + l152_f1, l152_f2 + l153_f1, l153_f2 + l154_f1, l154_f2 + l155_f1, l155_f2 + l156_f1, l156_f2 + l157_f1, l157_f2 + l158_f1, l158_f2 + l159_f1, l159_f2 + l160_f1, l160_f2 + l161_f1, l161_f2 + l162_f1, l162_f2 + l163_f1, l163_f2 + l164_f1, l164_f2 + l165_f1, l165_f2 + l166_f1, l166_f2 + l167_f1, l167_f2 + l168_f1, l168_f2 + l169_f1, l169_f2 + l170_f1, l170_f2 + l171_f1, l171_f2 + l172_f1, l172_f2 + l173_f1, l173_f2 + l174_f1, l174_f2 + l175_f1, l175_f2 + l176_f1, l176_f2 + l177_f1, l177_f2 + l178_f1, l178_f2 + l179_f1, l179_f2 + l180_f1, l180_f2 + l181_f1, l181_f2 + l182_f1, l182_f2 + l183_f1, l183_f2 + l184_f1, l184_f2 + l185_f1, l185_f2 + l186_f1, l186_f2 + l187_f1, l187_f2 + l188_f1, l188_f2 + l189_f1, l189_f2 + l190_f1, l190_f2 + l191_f1, l191_f2 + l192_f1, l192_f2 + l193_f1, l193_f2 + l194_f1, l194_f2 + l195_f1, l195_f2 + l196_f1, l196_f2 + l197_f1, l197_f2 + l198_f1, l198_f2 + l199_f1, l199_f2 + l200_f1, l200_f2 + l201_f1, l201_f2 + l202_f1, l202_f2 + l203_f1, l203_f2 + l204_f1, l204_f2 + l205_f1, l205_f2 + l206_f1, l206_f2 + l207_f1, l207_f2 + l208_f1, l208_f2 + l209_f1, l209_f2 + l210_f1, l210_f2 + l211_f1, l211_f2 + l212_f1, l212_f2 + l213_f1, l213_f2 + l214_f1, l214_f2 + l215_f1, l215_f2 + l216_f1, l216_f2 + l217_f1, l217_f2 + l218_f1, l218_f2 + l219_f1, l219_f2 + l220_f1, l220_f2 + l221_f1, l221_f2 + l222_f1, l222_f2 + l223_f1, l223_f2 + l224_f1, l224_f2 + l225_f1, l225_f2 + l226_f1, l226_f2 + l227_f1, l227_f2 + l228_f1, l228_f2 + l229_f1, l229_f2 + l230_f1, l230_f2 + l231_f1, l231_f2 + l232_f1, l232_f2 + l233_f1, l233_f2, l0_f1 + l1_f1, l2_f2, /* pass-through */ p_out1, p_out2;
	nbMass = 234;
	nbPosIn = 2;
	nbOut = 2;
};
process = in1, in2 : model:*(OutGain), *(OutGain);