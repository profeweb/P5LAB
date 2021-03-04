void keyPressed(){
  if(key=='j' || key=='J'){
    pantalla = Pantalla.JOC;
  }
  else if(keyCode==LEFT){
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
