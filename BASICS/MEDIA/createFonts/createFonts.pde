PFont f1, f2, f3;

void setup(){
  size(800,800);
  background(255);
  
  f1 = createFont("Arial", 100);
  f2 = createFont("Verdana", 100);
  f3 = createFont("Courier", 100);
}

void draw(){
  background(255);
  
  textFont(f1);
  textSize(100);
  textAlign(CENTER);
  fill(255,0,0);
  text("Arial", width/2, height/4);
  
  textFont(f2);
  textSize(120);
  textAlign(LEFT);
  fill(0,255,0);
  text("Verdana", width/4, height/2);
  
  textFont(f3);
  textSize(140);
  textAlign(RIGHT);
  fill(0,0, 255);
  text("Courier", 3*width/4, 3*height/4);
  
}
