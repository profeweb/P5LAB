int n = 1;
float d = 200;

void setup() {
  size(450, 450);
  background(255);
  fill(0); 
  stroke(0);
}

void draw(){
  background(255);
  fill(0); textSize(24);
  text(n, 50, 50);
  displayCircle(n);
}

void displayCircle(int n){
  for (int i=0; i<100000; i++) {
    float a = randomTimes(1, 0, TWO_PI);
    float r = d * (1 - randomTimes(n, 0, 1));
    point( width/2 + cos(a)*r, height/2 + sin(a)*r);
  }
  noLoop();
}

float randomTimes(int n, float minV, float maxV){
  float v = random(minV, maxV);
  for(int i=1; i<n; i++){
    v = random(v);
  }
  return v;
}

void keyPressed(){
  if(keyCode==LEFT){
    n--;
  }
  else if(keyCode==RIGHT){
    n++;
  }
  loop();
}
