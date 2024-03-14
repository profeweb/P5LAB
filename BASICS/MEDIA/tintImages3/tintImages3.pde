PImage imgZombie;  // 1) Declarar variable

void setup() {
  size(800, 800);
  imgZombie = loadImage("zombie.png");  // 2) Carregar la imatge
}

void draw() {
  background(255, 0, 0);
  if (mousePressed) {
    tint(200, 0, 0);
  } else {
    noTint();
  }

  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      image(imgZombie, i*250, 10 + j*250, 300, 200); // 3) Dibuixar imatge
    }
  }
}
