
void setup() {
  size(800, 800);
}

void draw() {

  int[] m = {0, 1, 2, 3, 4};

  for (int i=0; i<4; i++) {

    m[i] += m[ (i+1)%4 ];

    int x = (i+1)*100;
    
    if (m[i]%2 == 0) {
      circle(x, height/2, 50);
    }
    
  }
}
