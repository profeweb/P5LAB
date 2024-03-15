

boolean logged = false;
TextField userText, passText;
Button bLogin;

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  connexioBBDD();

   userText = new TextField(260, 103, 200, 35);
   passText = new TextField(260, 153, 200, 35);  
   bLogin = new Button("LOGIN", 260, 200, 200, 50);
  
}

void draw(){
 
  background(255);
  
  // Dibuixa les etiquetes de text
   fill(0); textSize(48); textAlign(LEFT);
   text("LOGIN FORM", 100, 60);
   textSize(24); 
   text("Username: ", 100, 130);
   text("Password: ", 100, 180);
   
   // Dibuixa els textfields i el botó
   userText.display();
   passText.display();
   bLogin.display();
   
   // Si el login és correcte
   if (logged) {
      fill(0); textAlign(CENTER);
      text("YOU ARE LOGGED IN!", width/2, 230);
   }
  
}

// Mira si pitjam sobre els camps de text
void mousePressed() {
   userText.isPressed();
   passText.isPressed();
   
   if(bLogin.mouseOverButton() && bLogin.enabled){
     String userName = userText.text;
     String password = passText.text;
     logged = isValidUser(userName, password);
     println(logged);
   }
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
