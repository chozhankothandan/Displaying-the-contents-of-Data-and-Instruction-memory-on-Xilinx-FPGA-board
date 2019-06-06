The main objective of this project is to simulate ARMv3 processor with memory mapped Input and Output instruction.
The status of DIP switches is read and it is given to LED output in FPGA board. 
Keil μVision4 is used to simulate the Assembly language and the functionality is verified. Then it is converted into HEX code and it is used in Verilog file(slowclk.v).
then the Behavioral simulation and synthesis is done and the warnings were cleared. The bit stream is generated and then it is programmed into FPGA and the hardware outputs were verified. 
The functionality is verified in the Keil μVision4 and the target is build and it is Rebuild and the generated HEX file in the same file directory is used to create HEX code. 
The software called HEX2ROM is used and the HEX file is loaded in this software then teh equivalent HEX/Binaries is generated in the same directory as a .v file.
The contens of .v file is pasted into the verilog file which is given as slowclk.v slowclk.v file contains the converted HEX code from which one by one instruction is taken and it is displayed in LED. 
The major clock frequency of the Hardware is 100MHz. If output runs at this clock frequency we can't verify the results. It is fast clock running in the verilog file with the name clock.v.
It is nothing but a 26 bit counter. To make the output more visible an internal slow clock is used in the name of Verilog file slowclk.v whose input clock pulse is driven by the 26 bit of the major counter.
Mux.v is used to select the 26th bit from the fast counter.
The files bntu.v and bntc.v are used to run the counter faster and pause the counter to verify the LED output respectively.
All the Verilog modules are instantiated in the Lab1.v file.
