# Generalised-CORDIC
A generalised CORDIC architecture which can calculate a variety of functions like sinx, arctan(x), hyperbolic fuctions and a lot more.

## Some specifics about the code
- We have used synthesizable 32 bit fixed point number format out of which 16 are fraction bits(after decimal).
- There are six modes:
  * Mode 0: Circular Rotation Mode
  * Mode 1: Circular Vector Mode
  * Mode 2: Linear Rotation Mode
  * Mode 3: Linear Vector Mode
  * Mode 4: Hyperbolic Rotation Mode
  * Mode 5: Hyperbolic Vector Mode
- At one time, only one mode can be used. To use a mode, comment out the rest of the modes in testbench.
- The code uses same hardware for all the modes, making it quite efficient. 
- There are two inputs. For linear mode, both inputs are used and for circular and hyperbolic modes, one input is used.
- For outputs, see either of X, Y or Z depending on the particular mode.
- Post synthesis and implementation simulations are verified in Vivado Design Suite. 
