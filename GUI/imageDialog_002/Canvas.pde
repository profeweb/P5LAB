class Canvas {

  DISTRIBUCIO distribucio = DISTRIBUCIO.TRESxTRES;
  PGraphics canvas;
  PImage[] imgs;
  int numImatge = 0;

  int x, y, w, h;

  Canvas(int x, int y, int w, int h) {
    this.x = x; 
    this.y = y;
    this.w = w; 
    this.h = h;

    // Crea array d'imatges buit
    this.imgs = new PImage[9];
  }

  void setDistribuicio(DISTRIBUCIO d) {
    this.distribucio = d;
  }

  void addImage(PImage img) {
    if (numImatge<imgs.length) {
      imgs[numImatge] = img;
      numImatge++; 
      updateCanvas(imgs, distribucio);
    }
  }

  void updateCanvas(PImage[] imgs, DISTRIBUCIO dist) {
    canvas = createGraphics(w, h);
    canvas.beginDraw();
    canvas.background(255);
    for (int i=0; i<imgs.length; i++) {
      if (imgs[i]!=null) {
        if (dist == DISTRIBUCIO.DOS_HORITZ) {
          canvas.image(imgs[i], 250*i, 0, 250, 500);
        } else if (dist == DISTRIBUCIO.DOSxDOS) {
          int f = i / 2;
          int c = i % 2;
          float wh = 500 / 2;
          canvas.image(imgs[i], wh*c, wh*f, wh, wh);
        } else if (dist == DISTRIBUCIO.TRESxTRES) {
          int f = i / 3;
          int c = i % 3;
          float wh = 500 / 3;
          canvas.image(imgs[i], wh*c, wh*f, wh, wh);
        }
      }
    }
    canvas.endDraw();
  }

  void resetCanvas() {
    imgs = new PImage[9];
    canvas = null;
    numImatge = 0;
  }

  void display() {
    fill(255);
    rect(10, 10, 500, 500);
    if (canvas!=null) {
      image(canvas, x, y, w, h);
    }
  }
}
