int numSecondsToChange = 10;
int numSeconds;
int lastTime = 0;
color bgColor = color(0);

void setup(){
  size(800, 800);
  lastTime = millis();
}

void draw(){
  background(bgColor);
  
  updateColor();
  
  fill(255); textSize(64); textAlign(CENTER);
  text(numSeconds, width/2, height/2);
}


void updateColor(){
  
  int now = millis();
  numSeconds = (now - lastTime) / 1000;
  
  if(numSeconds>= numSecondsToChange){
    lastTime = millis();
    bgColor = color(random(255), random(255), random(255));
  }
}
