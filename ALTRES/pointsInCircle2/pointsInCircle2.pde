int n = 1;
float d = 200;

PVector p;

void setup() {
  size(450, 450);
  background(255);
  fill(0); 
  stroke(0);
  
  p = new PVector(width/2 - 100, height/2 + 100);
}

void draw(){
  background(255);
  fill(0); textSize(24);
  text(n, 50, 50);
  displayCircle(n);
  fill(255, 0, 0);
  ellipse(p.x, p.y, 15, 15);
}

void displayCircle(int n){
  for (int i=0; i<100000; i++) {
    float a = randomTimes(1, 0, TWO_PI);
    float r = d * (1 - randomTimes(n, 0, 1));
    float x = p.x + cos(a)*r;
    float y = p.y + sin(a)*r;
    if(dist(x, y, width/2, height/2)>d){
      stroke(255, 0, 0);
    }
    else {
      stroke(0);
    }
    point( x, y);
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
