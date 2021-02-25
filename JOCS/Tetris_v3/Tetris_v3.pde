Tauler t;

Figura f1, f2, f3, f4, f5, f6;
color c1, c2, c3, c4, c5, c6;

Figura figActual;
boolean gameOver = false;

void setup(){
  
  size(800, 800);
  frameRate(5);
  
  t = new Tauler(30,30);
  
  c1 = color(255,0,0);
  int[][] qf1 = {{0,1,0},
                 {0,1,0},
                 {0,1,1}};
                 
  f1 = new Figura(qf1, c1);
  f1.setPosicio(3,3);

                 
  f2 = new FiguraZ();
  f2.setPosicio(6,2);
  
  c3 = color(0,255,0);
  int[][] qf3 = {{1,1},
                 {1,1}};
                 
  f3 = new Figura(qf3, c3);
  f3.setPosicio(12,12);
  
  c4 = color(0, 0,255);
  int[][] qf4 = {{0,1,0},
                 {0,1,1},
                 {0,1,0}};
                 
  f4 = new Figura(qf4, c4);
  f4.setPosicio(18,0);
  
  c5 = color(255, 0,255);
  int[][] qf5 = {{0,1,1},
                 {1,1,0},
                 {0,0,0}};
                 
  f5 = new Figura(qf5, c5);
  f5.setPosicio(18,2);
  
  c6 = color(255, 50,255);
  int[][] qf6 = {{0,0,1,0},
                 {0,0,1,0},
                 {0,0,1,0},
                 {0,0,1,0}};
                 
  f6 = new Figura(qf6, c6);
  f6.setPosicio(8,12);
  
  //t.afegirFigura(f1);
  //t.afegirFigura(f2);
  //t.afegirFigura(f3);
  //t.afegirFigura(f4);
  //t.afegirFigura(f5);
  //t.afegirFigura(f6);
  
  figActual = f1;
}


void draw(){
  background(255);
  
  // Dibuixa el tauler
  t.dibuixa();
    
  // Dibuixa la figura actual
  t.dibuixa(figActual);
    
  // DIbuixa la resta de figures
  t.dibuixaFigures();
    
  if(mousePressed){
    t.dibuixaCelles();
  }
    
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
    // SI la partida ha acabat!!!
    fill(0); textAlign(CENTER); textSize(50);
    text("GAME OVER", width/2, height/2);
    
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
    figActual.rota(t);
  }
}
