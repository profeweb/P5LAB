void setup(){
  size(600,600);
  fill(0);
  rectMode(CENTER);
}

void draw(){
  background(100, 200, 100);
  int c=0;
  int f = 0;
  for(int i=20; i<width; i+=50){
    c++; f=0;
    for(int j=20; j<height; j+=50){
      f++;
      if(c%2==0){
        fill(255); stroke(255);
      }
      else {
        fill(0); stroke(0);
      }
      ellipse(i, j, 20, 20);
    }
  }
}
