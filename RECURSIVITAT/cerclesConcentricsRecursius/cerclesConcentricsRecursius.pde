
void setup(){
  size(1400, 800);
  
}

void draw(){
  background(255);
  dibuixaCercle(width/2, height/2, 300, 10);
}

void dibuixaCercle(int x, int y, int r, float g){
  if(r> 20) {
    strokeWeight(g);
    ellipse(x, y, 2*r, 2*r);
    dibuixaCercle(x, y, r-20, g-0.5);
  }
}
