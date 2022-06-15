
void setup(){
  size(800, 800);
}

void draw(){

  int b = 100;
  
  for(int c=0; c<7; c++){
    for(int f=0; f<5; f++){
      
      int x = (c+1)*b;
      int y = (f+1)*b;
      
      circle(x, y, 50);
    }
  }
  
}
