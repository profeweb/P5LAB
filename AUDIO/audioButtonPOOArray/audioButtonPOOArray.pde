// Botons
SoundButton[] sbs;

// Noms fitxers d'audio
String[] sons = {"clap.wav", "saxo.wav", 
                 "snare.wav", "guitar.wav"};

// Colors actius dels botons
color[] c1s = {color(255, 0, 0), color(255, 255, 0), 
               color(255, 0, 255), color(0, 255, 0)};

// Color passiu dels botons
color c2 = color(100);

// 
boolean cursor = false;

void setup() {
  size(1400, 800);

  // Creació de l'array
  sbs = new SoundButton[4];

  // Creacions dels botons de l'array
  for (int i=0; i<sbs.length; i++) {
    // Constructor dels botons
    sbs[i] = new SoundButton((i+1)*width/5, height/2, 200, 
                              sons[i], this, c1s[i], c2);
  }
}

void draw() {
  // Està sonant algún 
  boolean estaSonant = false;
  for (int i=0; i<sbs.length; i++) {
    estaSonant = sbs[i].estaSonant();
    if (estaSonant) {
      break;
    }
  }
  
  // Si son algun, llavors color de fons
  if (estaSonant) {
    background(255, 255, 0);
  } else {
    background(255);
  }
  
  // Resetea cursor
  cursor = false;

  // Dibuixa els botons
  for (int i=0; i<sbs.length; i++) {
    sbs[i].dibuixa();
  }

  // Dibuixa el cursor
  displayCursor();
}

// Si pitjam mouse
void mousePressed() {
  for (int i=0; i<sbs.length; i++) {
    sbs[i].play();
  }
}

// Dibuixa el cursor adient
void displayCursor() {
  if (cursor) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}
