# Neural_Network
Implementation of logic gates using Neural Network in Arm Assembly Language

Implementation of the following LOGIC OPERATIONS using Neural Network in Cortex M4 process using Floating point processor. 


logic_and
logic_or
logic_not
logic_xor
logic_xnor
logic_nand
logic_nor

All the gate implementation take THREE INPUT.

Step-1: 
Implemented the sigmoid fucntion which can be used for implementing the basic Neural Network.
Once you compute the output value of NN it will be in FPU register in IEEE FP format.
This has to be converted to TRUE value and printed.

So to implement the feed forward function, We use using ST Microelectronics STM32F407VGTx board here (I mean the simulation model of this board) for this project.  


Step-2:
By using the above sigmoid function,the basic gates are implemented by giving appropriate weights to the inputs.
