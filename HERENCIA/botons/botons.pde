Boto[] botons;
int numBotons = 0;

color bgColor;

void setup() {
  size(800, 800);
  botons = new Boto[5];
  bgColor = color(255);
}


void draw() {
  background(bgColor);
  for (int i=0; i<numBotons; i++) {
    botons[i].display();
  }
  updateCursor();
}

void updateCursor() {
}

void keyPressed() {
  if (numBotons<5) {
    Boto b;
    if (random(1)<0.5) {
      b = new BotoRectangular(random(width), 
                              random(height), 
                              random(150,300),
                              random(80, 150),
                              String.valueOf(numBotons+1), 
                              color(random(255), random(255), random(255)));
    } else {
      float d = random(100, 200);
      b = new BotoCircular(random(width), 
                           random(height), 
                           d, d, String.valueOf(numBotons+1), 
                           color(random(255), random(255), random(255)));
    }
    botons[numBotons] = b;
    numBotons++;
  }
}

int mouseOver() {
  for (int i=0; i<numBotons; i++) {
    if (botons[i].mouseOver()) {
      return i;
    }
  }
  return -1;
}

void mousePressed() {

  int numBotoPitjat = mouseOver();
  if (numBotoPitjat!=-1 && botons[numBotoPitjat] instanceof BotoCircular) {
    bgColor = color(random(255), random(255), random(255));
  }
  else if (numBotoPitjat!=-1 && botons[numBotoPitjat] instanceof BotoRectangular) {
    bgColor = color(random(255));
  }
}
