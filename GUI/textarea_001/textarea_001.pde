// Exemple d'ús d'una Àrea de Text

// Declaració de les variables
TextArea areaText;

void setup() {
   size(800, 400);
   
   // Creació dels camps de text
   areaText = new TextArea(100, 100, 600, 250, 40, 5);
}

void draw() {
  
   background(180);

   // Dibuixa les etiquetes de text
   fill(0); textSize(48); textAlign(LEFT);
   text("Text Area", 100, 60);
   
   // Dibuixa l'àrea de text
   areaText.display();

}

// Mira si pitjam sobre l'àrea de text
void mousePressed() {
   areaText.isPressed();
}


// Quan pitjam tecla
void keyPressed() {
   areaText.keyPressed(key, (int)keyCode);
}
