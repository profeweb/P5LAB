
color c1 = color(255,0,0);
color c2 = color(0,0,255);

float amt;

void setup(){
  size(800,800);
  background(255);
}


void draw(){
   
  amt = mouseX/(float)width;
  
  color c = lerpColor(c1, c2, amt);

  background(c);
  
  fill(255);
  textSize(30);
  text("AMT: "+ nf(amt, 1, 2), 100,100);
  text("COLOR OUT: "+red(c)+", "+green(c)+", "+blue(c), 100,130);
  
}
