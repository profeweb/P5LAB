Casella[][] t;
String txt;

boolean guanya = false;
int numTirades = 0;
int pantalla = 0;

void setup(){
  size(800,800);
  creaTauler();
}

void draw(){
  
  if(pantalla == 0){
    background(255);
    dibuixaTauler();
    if(!guanya && numTirades<9){
      if(guanyaFiles() || guanyaCols() || guanyaDiagonal1() || guanyaDiagonal2()){
        guanya = true;
      }
    }
    if(numTirades==9 && !guanya){
      txt = "END. TABLAS";
      pantalla = 1;
    }
    else if(guanya) {
      int jugador = (numTirades +1) %2 + 1;
      txt = "GUANYA "+jugador;
      pantalla = 1;
    }
  }
  else if(pantalla==1){
    background(255, 0, 0);
    fill(0); textAlign(CENTER); textSize(48);
    text(txt, width/2, height/2);
  }
}

void mousePressed(){
  escoltaTauler();
}
