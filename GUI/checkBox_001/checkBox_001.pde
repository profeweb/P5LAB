// Exemple de component CheckBox

// Variables checkbox
CheckBox cb1, cb2, cb3;

float r, g, b;

void setup(){
  
  size(800,800);
  
  // Construcció dels checkboxes
  cb1 = new CheckBox(160,50,50);
  cb2 = new CheckBox(160,150,50);
  cb3 = new CheckBox(160,250,50);
  
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
  
  // Dibuixam els checkboxes
  cb1.display();
  cb2.display();
  cb3.display();
  
  // Miram el seu valor, per actualitzar r,g i b
  r = cb1.checked ? 255 : 0;
  g = cb2.checked ? 255 : 0;
  b = cb3.checked ? 255 : 0;
  
}

// Si pitjam el ratolí, miram si ho fem sobre un checkbox
void mousePressed(){
  if(cb1.onMouseOver()){
    cb1.toggle();
  }
  else if(cb2.onMouseOver()){
    cb2.toggle();
  }
  else if(cb3.onMouseOver()){
    cb3.toggle();
  }
}
