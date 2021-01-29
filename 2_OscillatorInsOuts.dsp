import("stdfaust.lib");

/* Faust PM Workshop : Introduction to Mass-Interaction Modelling */
/* Part 2: Using the Mass-Spring-Ground Oscillator */

// We're going to use some routing functions to give ourselves more control over the model

// First, let's say that we want to add a force input on the mass : create a route forces function that adds this force to the loopback force.

// Then, we probably want to listen to the position of the mass rather than the force exerced by the spring: position routing
// Careful, as we need to add a passthrough signal here in parallel to the spring calculation.

// so now we have a basic harmonic oscillator that we can excite with an input force and listen to.



in1 = button("test"):ba.impulsify * 0.1;

process = 
        (
        mi.mass(1, 0, 0, 0), mi.ground(0):
        RoutePositions:
        mi.springDamper(0.1, 0.001, 0, 0), _:
        RouteForces,_
        )~par(i,2,_):
    par(i,2,!),_
    with{
        RouteForces (f_sp1, f_sp2) = f_sp1 + in1, f_sp2;
        RoutePositions (p_m1, p_g1) = p_m1, p_g1, p_m1;
    }
;
