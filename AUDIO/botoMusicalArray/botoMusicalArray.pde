// Num de Botons
int numTecles = 8;

// Array de Botons Musicals
ButtonMusic[] b;

// Array amb el nom dels sons
String[] sons = {"clap.wav", "laser.wav", "saxo.wav", "snare.wav"};

color[] colors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0),};

void setup() {
  size(1400, 800);

  // Construcció de l'Array
  b = new ButtonMusic[numTecles];

  // Càlcul del radi de cada botó
  float r = width / (2f*numTecles);

  // Construcció de cada casella de l'Array
  for (int i=0; i<b.length; i++) {
    float x = 2*r*i + r;
    b[i] = new ButtonMusic(x, height/2, r, sons[i%sons.length], this, colors[i%colors.length] , color(100));
  }
}

void draw() {
  background(255, 0, 0);
  // Dibuixa totes les caselles de l'Array
  for (int i=0; i<b.length; i++) {
    b[i].display();
  }
  // Actualitza el cursor
  updateCursor();
}

void mousePressed() {
  // Comprova si pitjam damunt els botons
  for (int i=0; i<b.length; i++) {
    b[i].pitjaBoto();
  }
}

void updateCursor() {
  // Mira si el ratolí està a sobre d'algun botó
  boolean dins = false;
  for (int i=0; i<b.length; i++) {
    if(b[i].mouseOver()){
      dins = true;
      break;
    }
  }
  
  // Canvia la forma del cursor
  if (dins) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}
