void setup(){
  size(800,800);
  strokeWeight(1);
}

void draw(){
  for(float i=0; i<width; i+=1){
    stroke(i/width*255);
    line(i, 0, i, height); 
  }
}
