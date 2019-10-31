

float a = 0.0;  // Angle
float s = 0.0;  // Scale Factor
float w = 50;   // Rect side length

float marginLeft = 150;

void setup() {
  size(800, 800);
  rectMode(CENTER);
  frameRate(30);
}

void draw() {
  
  background(255);
  
  stroke(0);strokeWeight(1);
  line(0, height/2, width, height/2);
  strokeWeight(10); strokeCap(SQUARE);
  line(20,height/2, 20, height/2 -s*(height-5)/4);
  fill(0); textSize(16);
  text("Scale Factor:\n"+nf(s, 1, 2), 40, height/2 - 5);
  
  // Update angle and scale factor
  a = a + 0.03;
  s = cos(a)*2;
  
  translate(marginLeft, height/2);
  
  for(int i=0; i<4; i++){
    pushMatrix();
      translate((i+1)*w*2, 0);
      scale(s);
      fill(255/(i+1), 55*(4-i), i*50); noStroke();
      rect(0, 0, w, w);
    popMatrix();
  }
   
}
