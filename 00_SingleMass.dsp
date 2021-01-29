import("stdfaust.lib");

/* Faust PM Workshop : Introduction to Mass-Interaction Modelling */
/* Part 0: a single mass */

// Build a single mass and hit it

in1 = button("test"):ba.impulsify * 0.00001;
process = in1: mi.mass(1, 0, 0, 0);
