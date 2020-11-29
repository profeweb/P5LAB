void setup(){
  size(1400,800);
  background(255);
  dibuixaCercle(width/2, height/2, 300);
}

void dibuixaCercle(float x, float y, float r){
  stroke(3);
  ellipse(x, y, 2*r, 2*r);
  if(r>10){
    dibuixaCercle(x+r, y, r/2);
    dibuixaCercle(x-r, y, r/2);
  }
}
