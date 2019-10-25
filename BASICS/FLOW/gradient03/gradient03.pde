void setup(){
  size(800,800);
  background(255);
}

void draw(){
  for(float i=0; i<width; i++){
    for(float j=0; j<height; j++){
      stroke(i/width*255, j/width*255,0);
      point(i, j); 
    }
  }
}
