// Botons
SoundButton sb1, sb2;

// Colors
color c1 = color(255, 0, 0);
color c2 = color(100);

boolean cursor = false;

void setup(){
  size(800, 800);
  
  // Constructors dels botons
  sb1 = new SoundButton(width/3, height/2, 200, "clap.wav", this, c1, c2); 
  sb2 = new SoundButton(2*width/3, height/2, 200, "saxo.wav", this, c1, c2);
}
void draw(){
  if(sb1.estaSonant() || sb2.estaSonant()){
    background(255, 255, 0);
  }
  else {
    background(255);
  }
  cursor = false;
  
  // Dibuixa els botons
  sb1.dibuixa();
  sb2.dibuixa();
  
  // Dibuixa el cursor
  displayCursor();
}

// Si pitjam mouse
void mousePressed(){
  sb1.play();
  sb2.play();
}

// Dibuixa el cursor adient
void displayCursor(){
  if(cursor){
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }
}
