// Exemple d'ús de camps de Text

boolean logged = false;

// Declaració de les variables
TextField userText, passText;

void setup() {
  
   size(800, 400);
   
   // Creació dels camps de text
   userText = new TextField(260, 103, 200, 35);
   passText = new TextField(260, 153, 200, 35);
   
}

void draw() {
  
   background(180);

   // Dibuixa les etiquetes de text
   fill(0); textSize(48); textAlign(LEFT);
   text("LOGIN FORM", 100, 60);
   textSize(24); 
   text("Username: ", 100, 130);
   text("Password: ", 100, 180);
   
   // Dibuixa els camps de text
   userText.display();
   passText.display();
   
   // Si el login és correcte
   if (comprovaLogin()) {
      fill(250); textAlign(CENTER);
      text("YOU ARE LOGGED IN!", width/2, 230);
   }
}

// Mira si pitjam sobre els camps de text
void mousePressed() {
   userText.isPressed();
   passText.isPressed();
}

// Comprova si el login és correcte
boolean comprovaLogin() {
   if ( userText.text.equals("admin") && 
        passText.text.equals("1234")) {
      return true;
   } else {
      return false;
   }
}

// Quan pitjam tecla
void keyPressed() {
   userText.keyPressed(key, (int)keyCode);
   passText.keyPressed(key, (int)keyCode);
   comprovaLogin();
}
