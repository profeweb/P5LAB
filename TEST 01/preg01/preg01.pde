int a = 3;
int b = 7;

void setup(){
  size(800, 800);
}

void draw(){
  
  if((a < b) && ((b - a) < 2) || (b % a == 1)){
    circle(width/2,height/2, 50);
  }
  else if (a + 4 >= b) {
    rect(width/2, height/2, 50, 50);
  }
  else {
    point(width/2, height/2);
  }
}
