void setup(){
  size(800,800);
  background(255);
}

void draw(){
  for(float i=0; i<width; i++){
    for(float j=0; j<height; j++){
      float d = dist(i, j, width/2, height/2);
      if(d< 300){
      stroke((1 - d/width)*255,(1-d/width)*255,0);
      }
      else {
        stroke(255);
      }
      point(i, j); 
    }
  }
}
