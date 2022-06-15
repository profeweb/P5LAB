void setup() {
  size(800, 800);
}

void draw() {

  boolean[] m = {true, true, false, true};

  int i = 0;
  while (i<4) {
    
    int x = (i+1)*100;
    
    if (m[i]==true) {
      circle(x, height/2, 50);
    } else {
      rect(x, height/2, 50, 50);
    }
    
    i++;
  }
}
