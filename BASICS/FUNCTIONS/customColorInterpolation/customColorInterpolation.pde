
color c1 = color(255,0,0);
color c2 = color(0,0,255);
color c;

float amt;
float valueOut;

void setup(){
  size(800,800);
  background(255);
  strokeWeight(3);
  
  c1 = color(255,0,0);
  c2 = color(0,0,255);
}


void draw(){
   
  amt = mouseX/(float)width;
  
  float r = red(c1) + amt*(red(c2)-red(c1));
  float g = green(c1) + amt*(green(c2)-green(c1));
  float b = blue(c1) + amt*(blue(c2)-blue(c1));
  c = color(r, g, b);

  background(c);
  
  fill(255);
  textSize(30);
  text("AMT: "+ nf(amt, 1, 2), 100,100);
  text("COLOR OUT: "+red(c)+", "+green(c)+", "+blue(c), 100,130);
  
}
