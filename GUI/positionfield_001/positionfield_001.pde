// Exemple d'ús de Camps de Posició

// Declaració de variable de tipus PositionField
PositionField tf;

void setup() {
  
   size(800, 400);
   
   // Creació del camp de posició
   tf = new PositionField(260, 103, 300, 50);
   
}

void draw() {
  
   background(180);
   
   // Dibuixa el camp de posició
   tf.display();
   
}

// Mira si pitjam sobre el camp de posició
void mousePressed() {
   tf.isPressed();
}


// Quan pitjam tecla sobre el camp de posició
void keyPressed() {
   tf.keyPressed(key, (int)keyCode);
}
