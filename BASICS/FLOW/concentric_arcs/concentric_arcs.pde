void setup(){
  size(600,600);
  strokeWeight(3);
  rectMode(CENTER);
}

void draw(){
  background(255);
  for(int r=width-10; r>0; r-=20){
    arc(width/2, height/2, r, r, PI/4, TWO_PI - PI/4); 
    line(width/2, height/2, width/2 + r/2*cos(PI/4), height/2 + r/2*sin(TWO_PI - PI/4));
    line(width/2, height/2, width/2 + r/2*cos(PI/4), height/2 - r/2*sin(TWO_PI - PI/4));
  }
  
}
