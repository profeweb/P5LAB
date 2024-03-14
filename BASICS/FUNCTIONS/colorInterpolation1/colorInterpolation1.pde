float x;

void setup() {
  size(1000, 800);
}

void draw() {
  background(255);  

  for (int i = 0; i<=5; i++) {
    float amt = i / (float) 5;
    float ri = lerp(0, 255, amt);
    fill(ri, 0, 0);
    circle( 100 + i*150, height/2, 100);
    
    fill(0); 
    textSize(28); textAlign(CENTER);
    text(amt, 100 + i*150, 100);
  }
}
