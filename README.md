Verilog files for a working piano implemented ontop of a BAYSE 3 FPGA. 
Porject was Built ontop of Vivado Workspace. 

Using the Piano: 

  Switch 0 is used to toggle between Loud and Quiet(Emits the 3 MSB giving addition space for choording keys) 
  Switch 15-4 is from C to B Keys on the Piano 
  BTNL and BTNR switches the Octaves( Doubles to Frequencies ) 
  
Peripherals Used: 

DAC Connected to FPGA through the JG port. 

  https://digilent.com/shop/pmod-r2r-resistor-ladder-d-a-converter/ 
  
OP Amp Used to take the DAC Output and Amplify enough so the sound out is audible. 

  https://www.sparkfun.com/products/11044 
  
Speaker Connected to the OP Amp.

  https://www.sparkfun.com/products/9151

  
