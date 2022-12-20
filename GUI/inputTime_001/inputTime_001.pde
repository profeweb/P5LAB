// Exemple d'ús de Camps de Temps

// Declaració de variables de tipus TimeField
InputTime it1, it2;

void setup() {
  
   size(800, 800);
   
   // Creació dels camps de temps
   it1 = new InputTime(80, 200, 300, 500, "100 Esquena", "Paco");
   it2 = new InputTime(420, 200, 300, 500, "100 Papallona", "Maria");
   
}

void draw() {
  
   background(180);
   
   // Dibuixa els camps de temps
   it1.display();
   it2.display();
   
}

// Mira si pitjam sobre el camp de temps
void mousePressed() {
   it1.isPressed();
   it2.isPressed();
}


// Quan pitjam tecla sobre el camp de temps
void keyPressed() {
   it1.keyPressed(key, (int)keyCode);
   it2.keyPressed(key, (int)keyCode);
}
