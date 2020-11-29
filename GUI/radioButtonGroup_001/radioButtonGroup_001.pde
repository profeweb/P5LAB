// Exemple de component RadioButton

// Variables radio buttons
RadioButton rb1, rb2, rb3;

// Variable radio button group
RadioButtonGroup rbg;

float r, g, b;

void setup(){
  
  size(800,800);
  
  // Construcció dels radiobuttons
  rb1 = new RadioButton(180,75,15);
  rb2 = new RadioButton(180,175,15);
  rb3 = new RadioButton(180,275,15);
  
  //Construcció del radio button group
  rbg = new RadioButtonGroup(3);
  rbg.setRadioButtons(rb1, rb2, rb3);   // Format pels 3 radio buttons
  rbg.setSelected(2);                   // Inicialment seleccionat el 3r (2)
  
}

void draw(){
  
  background(r, g, b);
  
  if(r==g && g==b && r==0){
    fill(255);
  }
  else {
    fill(0); 
  }
  textSize(24);
  text("RED", 100, 85);
  text("GREEN", 70, 185);
  text("BLUE", 90, 285);
  
  // Dibuixam el radio button group
  rbg.display();
  
  // Miram el seu valor, per actualitzar r,g i b
  r = rb1.checked ? 255 : 0;
  g = rb2.checked ? 255 : 0;
  b = rb3.checked ? 255 : 0;
  
}

// Si pitjam el ratolí, miram si ho fem sobre un checkbox
void mousePressed(){
  rbg.updateOnClick();
}
