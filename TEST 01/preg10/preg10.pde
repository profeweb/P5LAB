int r;
void setup() {
  size(800, 800);
  r = update(3);
}

void draw() {
  background(255);
  circle(width/2, height/2, r);
}

int update(int n) {
  if (n%2==0) {
    return n*10;
  } else {
    return n*100;
  }
}
