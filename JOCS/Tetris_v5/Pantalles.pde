void pantallaMenu(){
}

void pantallaJoc(){
  background(255);
  pushMatrix();
      translate(t.x, t.y);
    // Dibuixa el tauler
    t.dibuixa();
      
    // Dibuixa la figura actual
    t.dibuixa(figActual);
  
  popMatrix();
    
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
        
        // Crear nova figura
        if(figs.isEmpty()){
          figs = new FigList();
        }
        figActual = figs.nextFigura();
        
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
