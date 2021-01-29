import("stdfaust.lib");

/* Faust PM Workshop : Introduction to Mass-Interaction Modelling */
/* Part 13: Perspectives for macro-objects (finite difference style approach) */

// Controls used in the patch
in1 = button("frcIn") : ba.impulsify * hslider("intensity[style:knob]", 0.1, 0.001, 1, 0.001);
stiffness = hslider("string stiffness", 0.4, 0.001, 0.5, 0.001);
damping = hslider("string damping", 0.01, 0.0001, 0.1, 0.0001);

excite = hslider("excitePos",0.4,0,1,0.0001) : si.smoo ;
listen = hslider("listenPos",0.3,0,1,0.0001) : si.smoo ;
couple = hslider("couplingPoint",0.7,0,1,0.0001) : si.smoo;

/* 
    "Macro" definition of a mass-interaction string: lots of masses and springs connected in a specific pattern.
    The first and last material elements of the string are fixed points.

    Note: This expression could be reduced into a finite difference scheme which would make it simpler (see Ricardo Russo's work!)
    In that case, you would update "grid points" that correspond to the masses with an update scheme that directly incorporates 
    the forces exerced by neighboring elements.
*/
string(nbMass, K, Z) =
    (
        forceSumming(nbMass):
        mi.ground(0.),
        par(i, nbMass-2, mi.mass(1., 0, 0., 0.)),
        mi.ground(0.):
        stringRoutePos(nbMass):
        par(i, nbMass-1, mi.springDamper(K, Z, 0., 0.)),
        par(i, nbMass, _):
        stringRouteForce(nbMass),
        par(i, nbMass, _)
    )
    ~par(i, nbMass, _):  
    par(i, nbMass,!),par(i, nbMass,_);

// Some functions that we need to deal with the string position and force routings
forceSumming(nb) = ro.interleave(nb,2):par(i,nb,+);
stringRoutePos(nb) = (par(i, nb,_<:_,_)):ro.interleave(2,nb):_, par(i, nb-2, (_<:_,_)), _, par(i,nb,_);
stringRouteForce(nb)= _, par(i, nb-2, _+_), _;


/*
    A wrapper around our string, allowing us to define an excitation point, listening point, and coupling junction to an outside element.
    
    - linear interpolation "proxies" are used to move these points along the string.
    - the wrapped string expects a force signal (from the outside coupling junction) and an input force
    - it outputs the position of its coupling junction, as well as a position output for listening to the string
*/
stringWrapper(nbMass, excitePos, listenPos, couplingPos) = (
    strProxFrc(nbMass, c), strProxFrc(nbMass, e):
    prox2str(nbMass, 2):
    string(nbMass, stiffness, damping):
    str2prox(nbMass, 2) :
    strProxPos(nbMass, c),strProxPos(nbMass, l)
    ) with{
        c = couplingPos*nbMass;
        e = excitePos*nbMass;
        l = listenPos*nbMass;
    }
;


// Linear interpolators
strProxFrc(nbMass, lPos) = 
    _<:par(i,nbMass,
        select2(i == m1, 
                select2(i == m2,
                    0,
                    alpha*_
                ), 
                (1-alpha)*_)
            )
    with{
        m1 = floor(lPos);
        m2 = floor(lPos)+1;
        alpha = lPos-m1;
    };


strProxPos(nbMass, lPos) = 
    (par(i,nbMass,
        _<:select2(i == m1, 
                select2(i ==m2,
                    0,
                    alpha*_
                ), 
                (1-alpha)*_
            )
        )
    ):>_
    with{
        m1 = floor(lPos);
        m2 = floor(lPos)+1;
        alpha = lPos-m1;
    };

// ZERO order interpolators (for testing - UNUSED)
strProxFrcZero(nbMass, lPos) = par(i, floor(lPos),0),_,par(i,nbMass-floor(lPos)-1, 0);
strProxPosZero(nbMass, lPos) = par(i, floor(lPos),!),1*_,par(i, nbMass-floor(lPos)-1, !);

// Functions needed to route the positions and forces of the string masses into and out of the interpolators
str2prox(nb, P) = (par(i, nb,_<:par(i,P,_))):ro.interleave(P,nb);
prox2str(nb, P) = ro.interleave(nb, P):(par(i, nb,par(i,P,_):>_));


/*
    The MODEL.

    It is composed of the wrapped string, coupled via a non-linear spring damper to a large oscillator.
    The coupling point bewteen the oscillator and the string can be moved along in real time.

    Note: some simple routing functions have been created to route the desired forces into the material elements (string junction and oscillator)
    and conversely for the positions output by the string coupling junction and the oscillator.
    This is quite simple to setup for a model this simple, but would get very hairy if we had many more elements: hence, the use of a modeller/FAUST code generator!
*/
model = (
    in1 : 
    (
    LoopbackRouting:
    stringWrapper(250, excite, listen, couple), mi.oscil(100, 0.1, 0.01, 0, 0, 0):
    PosRouting:
    mi.nlSpringDamperClipped(0.00001, 1, 0.1, 0.001, 0, 0),_
    )~par(i, 2, _) :
    par(i, 2, !), _

    )
    with{
        LoopbackRouting(fb_s1, fb_s2, frcIn) = fb_s1, frcIn, fb_s2;
        PosRouting(str_p1, str_p2, osc_p1) = str_p1, osc_p1, str_p2;

    };

process = model:_<:_,_;