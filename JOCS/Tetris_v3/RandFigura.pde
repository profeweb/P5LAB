
Figura creaFiguraRandom(){
  
  int f = 0;
  int rc = (int)random(0, t.numCols-4);
  
  int n = (int) random(0, 5);
  
  Figura fig;
  switch(n){
    case 0: fig = new FiguraZ();
            break;
            
    case 1: fig = new FiguraT();
            break;
            
    case 2: fig = new FiguraS();
            break;
            
    case 3: fig = new FiguraO();
            break;
            
    case 4: fig = new FiguraI();
            break;
            
    default: fig = new FiguraO();
             break;
  }
  
  fig.setPosicio(f, rc);
  return fig;
}
