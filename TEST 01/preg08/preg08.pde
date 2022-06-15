void setup() {
  size(800, 800);
}

void draw() {
  
  int[] m = {5, 10, 4, 22};
  boolean trobat = false;
  int x = 4;

  int i = 0;
  while(trobat==false && i<4) {
    if(m[i]==x){
      trobat = true;
    }
    i++;
  }
  
  if(trobat==true){
    circle(width/2, height/2, 50);
  }
  else {
    rect(width/2, height/2, 50, 50);
  }
}
