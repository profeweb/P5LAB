color r = color(255, 0, 0);
color b = color(0, 0, 255);
color c;

void setup() {
  size(800, 800);
  c = mescla(r, b);
}

void draw() {
  background(255);
  fill(c);
  circle(width/2, height/2, 100);
}

color mescla(color c1, color c2) {
  return lerpColor(c1, c2, 0.5);
}
