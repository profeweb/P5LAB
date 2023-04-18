float[] x;
float[] y;
float[] r;
color[] c;

void setup() {
  size(800, 800);

  x = new float[100];
  y = new float[100];
  c = new color[100];
  r = new float[100];

  for (int i=0; i<x.length; i++) {
    x[i] = random(width/9, 8*width/9);
    y[i] = random(-height, 0);
    c[i] = color(random(255), random(255), random(255));
    r[i] = random(10, 60);
  }
}

void draw() {
  background(255);

  for (int i=0; i<x.length; i++) {
    fill(c[i]);
    circle(x[i], y[i], r[i]);

    y[i]+=1;
    x[i]+=random(-1.5, 1.5);
    if (y[i]>height) {
      x[i] = random(width/9, 8*width/9);
      y[i] = random(0, -height);
      c[i] = color(random(255), random(255), random(255));
    }
  }
}
