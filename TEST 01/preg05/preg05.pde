
void setup(){
  size(800, 800);
}

void draw(){
 
  int x =0, b = 100;
  
  for(int i=0; i<7; i++){
    x = x + b;
    if( i% 3 == 0){
      fill(255, 0, 0);
    }
    else {
      fill(0);
    }
    circle(x, height/2, 50);
  }
  
}
