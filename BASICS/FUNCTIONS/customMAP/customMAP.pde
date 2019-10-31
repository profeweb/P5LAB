
float lowIn = 0;
float lowOut = 0;

float highIn = 800;
float highOut = 255;

float valueIn;
float valueOut;

void setup(){
  size(800,800);
  background(255);
  strokeWeight(3);
}


void draw(){
   
  valueIn = mouseX;
  float p = (valueIn - lowIn)/(highIn - lowIn);
  valueOut = lowOut + p*(highOut - lowOut);

  background(valueOut, 0, 0);
  
  fill(255);
  textSize(30);
  text("VALUE IN: "+ nf(valueIn, 3, 0), 100,100);
  text("VALUE OUT: "+nf(valueOut, 3,1), 100,130);
  
}
