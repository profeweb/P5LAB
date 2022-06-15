int r;
void setup() {
  size(800, 800);
  calcula(10);
}

void draw() {
  background(255);
  circle(width/2, height/2, r);
}

void calcula(int n) {
  if (n == 1) {
    r = 5;
  } else if(n%2==0) {
    r = 100;
  } else {
    r = n;
  }
}
