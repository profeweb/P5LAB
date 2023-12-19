import processing.sound.*;

// Components de la GUI
// Music Player

MusicPlayer mp;

void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
  // Creació del Music Player
  mp = new MusicPlayer(120, height/3);
  
  // Assignació del so a reproduir
  mp.setSound(this, "saxo.wav");
}

void draw(){
  
  // Fons de la finestra
  background(200);
  
  // Dibuixa el MusicPlayer
  mp.display();
  
  // Actualitza cursor (ARROW o HAND).
  updateCursor();
}

// En cas de pitjar el ratolí
void mousePressed(){
  mp.checkButtons();
}


// Modifica el cursor
void updateCursor(){
  
  if(mp.mouseOverButtons()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
