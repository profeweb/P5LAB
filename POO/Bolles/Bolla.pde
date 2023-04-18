class Bolla {

  float x, y, r;
  color c;
  
  Bolla(){
    x = random(width/9, 8*width/9);
    y = random(-height, 0);
    c = color(random(255), random(255), random(255));
    r = random(10, 60);
  }

  Bolla(float x, float y, float r, color c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
  }

  Bolla(float x, float y) {
    this.x = x;
    this.y = y;
    this.r = 50;
    this.c = color(0);
  }

  void dibuixa() {
    fill(c);
    circle(x, y, r);
  }

  void mou() {
    y+=1;
    x+=random(-1.5, 1.5);
    if (y>height) {
      x = random(width/9, 8*width/9);
      y = random(0, -height);
      c = color(random(255), random(255), random(255));
    }
  }
}
