import("stdfaust.lib");

/* Faust PM Workshop : Introduction to Mass-Interaction Modelling */
/* Part 5: Building a two mass system via a MIMS script */

in1 = button("Frc Input 1"): ba.impulsify * 0.1;  	//write a specific force input signal operation here

OutGain = 1;

K = 0.1;
Z = 0.001;

model = (
	mi.mass(1, 0, 0, 0),
	mi.mass(1, 0, 0, 0),
	mi.ground(0),
	par(i, nbFrcIn,_):
	RoutingMassToLink ,
	par(i, nbFrcIn,_):
	mi.springDamper(K, Z, 0, 0),
	mi.springDamper(K, Z, 0, 0),
	par(i, nbOut+nbFrcIn, _):
	RoutingLinkToMass
)~par(i, nbMass, _):
par(i, nbMass, !), par(i, nbOut , _)
with{
	RoutingMassToLink(m0, m1, m2) = /* routed positions */ m0, m2, m0, m1, /* outputs */ m0;
	RoutingLinkToMass(l0_f1, l0_f2, l1_f1, l1_f2, p_out1, f_in1) = /* routed forces  */ f_in1 + l0_f1 + l1_f1, l1_f2, l0_f2, /* pass-through */ p_out1;
	nbMass = 3;
	nbFrcIn = 1;
	nbOut = 1;
};
process = in1 : model:*(OutGain);