import("stdfaust.lib");

/* Faust PM Workshop : Introduction to Mass-Interaction Modelling */
/* Part 7: Creating a basic string */

in1 = button("Frc Input 1"): ba.impulsify * 0.1;  	//write a specific force input signal operation here

OutGain = 1;

str_M = 1.0;
str_K = 0.2;
str_Z = 0.001;
str_Zo = 0.0;

model = (
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
	mi.ground(0.00),
	par(i, nbFrcIn,_):
	RoutingMassToLink ,
	par(i, nbFrcIn,_):
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
	par(i, nbOut+nbFrcIn, _):
	RoutingLinkToMass
)~par(i, nbMass, _):
par(i, nbMass, !), par(i, nbOut , _)
with{
	RoutingMassToLink(m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16, m17, m18, m19, m20, m21, m22, m23, m24, m25, m26, m27, m28, m29, m30, m31) = /* routed positions */ m0, m1, m1, m2, m2, m3, m3, m4, m4, m5, m5, m6, m6, m7, m7, m8, m8, m9, m9, m10, m10, m11, m11, m12, m12, m13, m13, m14, m14, m15, m15, m16, m16, m17, m17, m18, m18, m19, m19, m20, m20, m21, m21, m22, m22, m23, m23, m24, m24, m25, m25, m26, m26, m27, m27, m28, m28, m29, m29, m30, m30, m31, /* outputs */ m28, m4;
	RoutingLinkToMass(l0_f1, l0_f2, l1_f1, l1_f2, l2_f1, l2_f2, l3_f1, l3_f2, l4_f1, l4_f2, l5_f1, l5_f2, l6_f1, l6_f2, l7_f1, l7_f2, l8_f1, l8_f2, l9_f1, l9_f2, l10_f1, l10_f2, l11_f1, l11_f2, l12_f1, l12_f2, l13_f1, l13_f2, l14_f1, l14_f2, l15_f1, l15_f2, l16_f1, l16_f2, l17_f1, l17_f2, l18_f1, l18_f2, l19_f1, l19_f2, l20_f1, l20_f2, l21_f1, l21_f2, l22_f1, l22_f2, l23_f1, l23_f2, l24_f1, l24_f2, l25_f1, l25_f2, l26_f1, l26_f2, l27_f1, l27_f2, l28_f1, l28_f2, l29_f1, l29_f2, l30_f1, l30_f2, p_out1, p_out2, f_in1) = /* routed forces  */ l0_f1, l0_f2 + l1_f1, l1_f2 + l2_f1, l2_f2 + l3_f1, l3_f2 + l4_f1, l4_f2 + l5_f1, l5_f2 + l6_f1, l6_f2 + l7_f1, l7_f2 + l8_f1, l8_f2 + l9_f1, l9_f2 + l10_f1, f_in1 + l10_f2 + l11_f1, l11_f2 + l12_f1, l12_f2 + l13_f1, l13_f2 + l14_f1, l14_f2 + l15_f1, l15_f2 + l16_f1, l16_f2 + l17_f1, l17_f2 + l18_f1, l18_f2 + l19_f1, l19_f2 + l20_f1, l20_f2 + l21_f1, l21_f2 + l22_f1, l22_f2 + l23_f1, l23_f2 + l24_f1, l24_f2 + l25_f1, l25_f2 + l26_f1, l26_f2 + l27_f1, l27_f2 + l28_f1, l28_f2 + l29_f1, l29_f2 + l30_f1, l30_f2, /* pass-through */ p_out1, p_out2;
	nbMass = 32;
	nbFrcIn = 1;
	nbOut = 2;
};
process = in1 : model:*(OutGain), *(OutGain);