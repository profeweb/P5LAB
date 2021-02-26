
Tauler t;
Figura figActual;
boolean gameOver = false;
int numLinies = 0;

void setup(){
  
  size(400, 800);
  frameRate(5);
  
  t = new Tauler(20,40);
  figActual = creaFiguraRandom();
}


void draw(){
  background(255);
  
  // Dibuixa el tauler
  t.dibuixa();
    
  // Dibuixa la figura actual
  t.dibuixa(figActual);
    
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
            t.baixarFiguresAbansDe(f);
            numLinies++;
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
    text("FIGURES:"+t.getNumFigures(), width/2, height/2 + 100);
    // Número de línies  
    text("LINIES:"+numLinies, width/2, height/2+200);
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
  else if(key=='b' || key=='B'){
    figActual.mouTopeBaix(t);
  }
}
