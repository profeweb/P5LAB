int numTecles = 8;
ButtonMusic[] b;

void setup() {
  size(1400, 800);

  b = new ButtonMusic[numTecles];

  float r = width / (2f*numTecles);

  for (int i=0; i<b.length; i++) {
    float x = 2*r*i + r;
    b[i] = new ButtonMusic(x, height/2, r, "saxo.wav", 
      this, color(255, 0, 0), color(100, 100, 100));
  }
}

void draw() {
  background(255);
  for (int i=0; i<b.length; i++) {
    b[i].display();
  }
  updateCursor();
}

void mousePressed() {
  for (int i=0; i<b.length; i++) {
    b[i].pitjaBoto();
  }
}

void updateCursor() {
  boolean dins = false;
  for (int i=0; i<b.length; i++) {
    if(b[i].mouseOver()){
      dins = true;
      break;
    }
  }
  
  if (dins) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}
