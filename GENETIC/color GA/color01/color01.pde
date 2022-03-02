// Número d'Elements
int numColors = 10;

// Número de Generació
int generacio = 0;

// Població inicial
Color[] poblacio;

float wItem, hItem;
boolean acabar = false;
Color desti;

void setup() {
  size(1600, 900);
  desti = new Color(255, 255, 0);
  
  // Inicialització de la Població
  init(numColors);
}

void draw() {
  background(255);

  // Avaluació de la Població
  avalua();
  // Miram si ja hem acabat
  if (!acaba()) {
    // Seleccionam els millors
    selecciona();
    // Els creuam
    creua();
    // Ocorre certa mutació
    muta();
  }
  // Visualitzam el procés
  display();
  noLoop();
}

// Inicialitza la Població
void init(int num) {
  
  poblacio = new Color[num];
  
  for (int i=0; i<poblacio.length; i++) {
    // Color aleatori
    poblacio[i] = new Color();
  }

  wItem = (width - 10) / (float)poblacio.length;
  hItem = 80;
}

// Avalua la Població
void avalua() {
}

// Selecció dels millors exemplars
void selecciona() {
}

// Creuament dels millors exemplars
void creua() {
}

// Mutació
void muta() {
}

// Comprovació d'acabament
boolean acaba() {
  return true;
}


// Visualització de Generació
void display() {
  fill(0); textSize(44); textAlign(CENTER);
  text("GENERACIÓ "+generacio, width/2, 60);
  displayColors(poblacio, 80);

}

// Visualitza un array de colors
void displayColors(Color[] array, float y) {
  for (int i=0; i<array.length; i++) {
    array[i].display(i*wItem + 5 + wItem/2, y + hItem/2, wItem, hItem);
  }
}


void keyPressed() {
  if (keyCode==RIGHT) {
    // Si no hem acabat, passar a la seguent generació
    if (!acabar) {
      generacio++;
      init(numColors);
      loop();
    }
  }
}
