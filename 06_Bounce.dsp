import("stdfaust.lib");

/* Faust PM Workshop : Introduction to Mass-Interaction Modelling */
/* Part 6: Bounce a hammer on the two mass system */

OutGain = 30;

K = 0.1;
Z = 0.001;
grav = 0.5;

model = (
	mi.mass(1, 0, 0, 0),
	mi.mass(1, 0, 0, 0),
	mi.ground(0),
	mi.mass(5., grav/ ma.SR, 10, 10 - (-100/ ma.SR)):
	RoutingMassToLink :
	mi.springDamper(K, Z, 0, 0),
	mi.springDamper(K, Z, 0, 0),
	mi.collision(0.1, 0.01, 0, 0, 10),
	par(i, nbOut, _):
	RoutingLinkToMass
)~par(i, nbMass, _):
par(i, nbMass, !), par(i, nbOut , _)
with{
	RoutingMassToLink(m0, m1, m2, m3) = /* routed positions */ m0, m2, m0, m1, m1, m3, /* outputs */ m0;
	RoutingLinkToMass(l0_f1, l0_f2, l1_f1, l1_f2, l2_f1, l2_f2, p_out1) = /* routed forces  */ l0_f1 + l1_f1, l1_f2 + l2_f1, l0_f2, l2_f2, /* pass-through */ p_out1;
	nbMass = 4;
	nbOut = 1;
};
process = model:*(OutGain);