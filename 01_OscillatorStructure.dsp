import("stdfaust.lib");

/* Faust PM Workshop : Introduction to Mass-Interaction Modelling */
/* Part 1: Designing a Mass-Spring-Ground Oscillator */

//  A basic, hand coded mass spring oscillator

// First we create the physical elements
// note that all mass elements are set up in parallel, same for all interactions.

// set the mass to have an initial vel of 0.1 meters per sample to check
// if we want to be rigorous this previous position needs to be applied to the spring damper so that its first step computes correctly.

process = 
        (mi.mass(1, 0, 0, 0.1), mi.ground(0):
        mi.springDamper(0.1, 0.001, 0.1, 0)
        )~par(i,2,_)
;


// So now we have a basic loopback of force calculations into the mass elements: the physics will start working

// But we have no means of action on the object and the outputs we are listening to are the forces applied by the spring
