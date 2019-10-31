
float lowOut = 0;
float highOut = 255;

float amt;
float valueOut;

void setup(){
  size(800,800);
  background(255);
  strokeWeight(3);
}


void draw(){
   
  amt = mouseX/(float)width;
  valueOut = lowOut + amt*(highOut - lowOut);

  background(valueOut, 0, 0);
  
  fill(255);
  textSize(30);
  text("AMT: "+ nf(amt, 1, 2), 100,100);
  text("VALUE OUT: "+nf(valueOut, 3,1), 100,130);
  
}
