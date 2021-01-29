import("stdfaust.lib");

/* Faust PM Workshop : Introduction to Mass-Interaction Modelling */
/* Part 3: Integrated Mass-Spring-Ground Oscillator */

// Note: in this case, we could have simply used the osil module, which is an integrated mass spring oscillator:


in1 = button("test"):ba.impulsify * 0.1;

process = in1: mi.oscil(1, 0.1, 0.001, 0, 0, 0);

