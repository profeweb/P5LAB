
void setup(){
  size(800, 800);
}

void draw(){
  
  int i = 0, x = 0, b = 50;
  
  while(i < 15){
    x = x + b;
    line(x, 0, x, height);
    i++;
  }
  
}
