// Exemple d'ús de Camps de Temps

// Declaració de variable de tipus TimeField
TimeField tf;

void setup() {
  
   size(800, 400);
   
   // Creació del camp de temps
   tf = new TimeField(260, 103, 300, 50);
   
}

void draw() {
  
   background(180);
   
   // Dibuixa el camp de temps
   tf.display();
   
}

// Mira si pitjam sobre el camp de temps
void mousePressed() {
   tf.isPressed();
}


// Quan pitjam tecla sobre el camp de temps
void keyPressed() {
   tf.keyPressed(key, (int)keyCode);
}
