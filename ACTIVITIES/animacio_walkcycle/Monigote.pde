class Monigote {

  PImage[] imgs;
  int numFrame = 0;
  boolean motionEnabled = false;
  int speed = 15;
  float x, y;

  Monigote() {
    imgs = new PImage[8];
    for (int i=0; i<imgs.length; i++) {
      imgs[i] = loadImage("frame"+i+".png");
    }
    x = width/2;
    y = height/2;
  }

  void mou() {
    if (motionEnabled && frameCount%speed==0) {
      numFrame++;
      if (numFrame==imgs.length) {
        numFrame = 0;
      }
    }
  }

  void dibuixa() {
    imageMode(CENTER);
    image(imgs[numFrame], x, y);
  }
}
