// Components de la GUI

// Tria de 4 opcions
Tria4 t;

// Dimensions del Confirm 
float compW = 900;
float compH = 340;

// Textos del Confirm
String title = "Canvia de Color!";
String message = "Tria el nou color de fons";

// Color del fons
color colFons = color(255);

void setup() {

  size(1400, 800);      // Dimensions de la Pantalla

  // Creació del Confirm
  t = new Tria4(title, message, 100, 100, compW, compH);
  t.setTextButtons("Vermell", "Verd", "Blau", "Groc");
}

void draw() {

  background(colFons);

  // Dibuixa el Tria4
  t.display();

  if (!t.visible) {
    fill(0); 
    textSize(30);
    text("Fes clic per obrir el tria", 100, 100);
  }

  // Actualitza cursor
  updateCursor();
}

void mousePressed() {

  if (t.b1.mouseOverButton() && t.b1.enabled) {
    t.setVisible(false);
    colFons = color(255, 0, 0);
  } else if (t.b2.mouseOverButton() && t.b2.enabled) {
    t.setVisible(false);
    colFons = color(0, 255, 0);
  } else if (t.b3.mouseOverButton() && t.b3.enabled) {
    t.setVisible(false);
    colFons = color(0, 0, 255);
  } else if (t.b4.mouseOverButton() && t.b4.enabled) {
    t.setVisible(false);
    colFons = color(255, 255, 0);
  } else {
    t.setVisible(true);
  }
}

// Modifica el cursor
void updateCursor() {

  if ((t.b1.mouseOverButton() && t.b1.enabled) ||
    (t.b2.mouseOverButton() && t.b2.enabled) ||
    (t.b3.mouseOverButton() && t.b3.enabled) ||
    (t.b4.mouseOverButton() && t.b4.enabled)) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}
