class Slider {

  String s;
  int x, y, w, h;
  float minV, maxV, v;

  Slider (String s, int x, int y, int w, int h, int minV, int maxV, int val) {
    this.s = s;
    this.x = x; this.y = y;
    this.w = w; this.h = h;
    this.v = val; this.minV = minV; this.maxV = maxV;
  }

  void display() {
    pushStyle();
      fill(255, 100, 100); strokeWeight(3);
      rect(x, y, w, h, 5);
      noStroke(); fill(0);
      rect(x + map(v, minV, maxV, 0, w), y, 15, h);
      fill(255); textAlign(CENTER); textSize(24);
      text((int)v, x + map(v, minV, maxV, 0, w), y +h/2);
      fill(0); textAlign(LEFT);
      text(s, x + 5, y -10);
    popStyle();
  }

  boolean mouseOnSlider() {
    return ((mouseX>x) && (mouseX<x+w) && 
            (mouseY>=y)&& (mouseY<=y+h));
  }

  void updateSlider() {
    v = map(mouseX, x, x+w, minV, maxV);
    v = constrain(v, minV,maxV);
  }

}
