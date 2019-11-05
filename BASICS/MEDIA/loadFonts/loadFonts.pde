PFont f1, f2, f3;

void setup(){
  size(800,800);
  background(255);
  
  f1 = loadFont("InkFree-100.vlw");
  f2 = loadFont("MVBoli-120.vlw");
  f3 = loadFont("SitkaText-140.vlw");
}

void draw(){
  background(255);
  
  textFont(f1, 100);
  textAlign(RIGHT);
  fill(255,0,0);
  text("InkFree", 2*width/3, height/4);
  
  textFont(f2, 120);
  textAlign(LEFT);
  fill(0,255,0);
  text("MVBoli", width/4, height/2);
  
  textFont(f3, 140);
  textAlign(CENTER);
  fill(0,0, 255);
  text("SitkaText", width/2, 3*height/4);
  
}
