import("stdfaust.lib");

/* Faust PM Workshop : Introduction to Mass-Interaction Modelling */
/* Part 4: Building a two mass system */

// If we wanted to go a little further from here: add a second mass to the system

// Add a second mass after the first one and before the ground module.

// Add a second spring into the system

// So now we need to change the the position routing so that one spring computes between m1 and ground, and the second between m1 and m2
// This also means we have to change the force routing function to account for the sum of forces on each element:
    // m1 receives forces from the first connection of sp1, and the first connection of sp2, and the external force input.
    // m2 receives forces from the second connection of sp2
    // g1 receives forces from the second connection of sp1

// Now we have a system with two connected masses: giving to resonating modes (try and see)

in1 = button("test"):ba.impulsify * 0.1;

process = 
        (
        mi.mass(3, 0, 0, 0), mi.mass(2, 0, 0, 0), mi.ground(0):
        RoutePositions:
        mi.springDamper(0.1, 0.001, 0, 0), mi.springDamper(0.01, 0.001, 0, 0), _:
        RouteForces,_
        )~par(i,3,_):
    par(i,3,!),_
    with{
        RouteForces (f_sp1, f_sp2, f2_sp1, f2_sp2) = f_sp1 + in1 + f2_sp1, f2_sp2, f_sp2 ;
        RoutePositions (p_m1, p_m2, p_g1) = p_m1, p_g1, p_m1, p_m2, p_m1;
    }
;

// This works as expected, but its starting to get a bit hard to understand. If we were to make the model more complex, the routing functions would become quite a hassle...

//this is why a modelling or code generation system is very useful! Somewhere we can focus on the physical topology and parameters, and let the machine sort out the connection patterns and such.
