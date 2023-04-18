int n=10;
Bolla[] b;

void setup() {
  size(800, 800);
  b = new Bolla[n];
  for (int i=0; i<b.length; i++) {
    b[i] = new Bolla();
  }
}

void draw() {
  background(255);
  for (int i=0; i<b.length; i++) {
    b[i].dibuixa();
    b[i].mou();
  }
}
