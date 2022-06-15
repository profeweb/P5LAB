int a = 3;
int b = 7;

void setup(){
  size(800, 800);
}

void draw(){
  
  if( a == b/3){
    circle(width/2,height/2, 50);
  }
  else if ( b/a > 1) {
    rect(width/2, height/2, 50, 50);
  }
  else {
    point(width/2, height/2);
  }
}
