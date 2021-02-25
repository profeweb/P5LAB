
Tauler t;
Figura figActual;
boolean gameOver = false;

void setup(){
  
  size(800, 800);
  frameRate(5);
  
  t = new Tauler(30,30);
  figActual = creaFiguraRandom();
}


void draw(){
  background(255);
  
  // Dibuixa el tauler
  t.dibuixa();
    
  // Dibuixa la figura actual
  t.dibuixa(figActual);
    
  // Dibuixa la resta de figures
  t.dibuixaFigures();
    
  // Per debuggear
  if(mousePressed){
    t.dibuixaCelles();
  }
    
  // Bucle del joc
  if(!gameOver){
    if(!figActual.mouBaix(t)){
      println("Figura bloquejada!!");
      if(figActual.fila==0){
        println("Partida acabada!!");
        gameOver = true;
      }
      else{
        // Afegir figura al tauler
        t.afegirFigura(figActual);
        t.aplica(figActual);
        
        // Comprovar linies
        boolean[] plenes = t.comprovaFilesPlenes();
        for(int f=0; f<plenes.length; f++){
          if(plenes[f]==true){
            t.borraFila(f);
          }
        }
        
        // Crear nova figura aleatòria
        figActual = creaFiguraRandom();
      }
    }
  }
  else {
    // Si la partida ha acabat!!!
    fill(0); textAlign(CENTER); textSize(50);
    text("GAME OVER", width/2, height/2);
    // Número de figures col·locades
    text(t.getNumFigures(), width/2, height/2 + 100);
  }
}


void keyPressed(){
  if(keyCode==LEFT){
    figActual.mouEsquerra(t);
  }
  else if(keyCode==RIGHT){
    figActual.mouDreta(t);
  }
  else if(keyCode==DOWN){
    figActual.mouBaix(t);
  }
  else if(key=='r' || key=='R'){
    figActual.rota();
  }
}
