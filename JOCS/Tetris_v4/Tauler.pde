
class Tauler {
  
  int numCols, numFils;
  float cellWidth, cellHeight;
  int[][] cells;
  
  ArrayList<Figura> figures;
  
  Tauler(int nc, int nf){
    this.numCols = nc;
    this.numFils = nf;
    this.cellWidth = width/(float)numCols;
    this.cellHeight = height/(float)numFils;
    
    figures = new ArrayList<Figura>();
    reset();
  }
  
  void afegirFigura(Figura f){
    figures.add(f);
  }
  
  Figura getFigActual(){
    return this.figures.get(0);
  }
  
  int getNumFigures(){
    return this.figures.size();
  }
  
  
  void reset(){
    cells = new int[numFils][numCols];
    for(int c=0; c<numCols; c++){
      for(int f=0; f<numFils; f++){
        cells[f][c]=0;
      }
    }
  }
  
  void dibuixa(){
    dibuixaGraella();
    dibuixaCelles();
  }
  
  void dibuixaGraella(){
    for(float c=0; c<numCols; c++){
      for(float f=0; f<numFils; f++){
        fill(colorBUIT);
        stroke(0);
        rect(c*cellWidth, f*cellHeight, cellWidth, cellHeight);
      } 
    }
  }
  
  void dibuixaCelles(){
    for(int c=0; c<numCols; c++){
      for(int f=0; f<numFils; f++){
        fill(colorBUIT);
        if(cells[f][c]!=0){
          int numColor = cells[f][c];
          fill(colors[numColor]);
        }
        stroke(0);
        rect(c*cellWidth, f*cellHeight, cellWidth, cellHeight);
      } 
    }
  }
  
  
  void aplica(Figura fig){
    for(int f=0; f<fig.quadres.length; f++){
      for(int c=0; c<fig.quadres[0].length; c++){
        if(fig.quadres[f][c]==1){
          int ct = c + fig.col;
          int ft = f + fig.fila;
          this.cells[ft][ct] = fig.tipus;
        }
      } 
    }
  }
  
  void dibuixa(Figura fig){
    for(int f=0; f<fig.quadres.length; f++){
      for(int c=0; c<fig.quadres[0].length; c++){
        int ct = c + fig.col;
        int ft = f + fig.fila;
        if(fig.quadres[f][c]==1){
          fill(colors[fig.tipus]);
          stroke(0);
        }
        else{
          fill(100, 50);
        }
        rect(ct*cellWidth, ft*cellHeight, cellWidth, cellHeight);
      } 
    }
  }
  
  boolean[] comprovaFilesPlenes(){
    boolean[] plenes = new boolean[cells.length];
    for(int nf = cells.length -1; nf>=0; nf--){
      plenes[nf] = filaPlena(nf);
    }
    return plenes;
  }
  
  boolean filaPlena(int nf){
    for(int c=0; c<cells[nf].length; c++){
      if(cells[nf][c]==0){
        return false;
      }
    }
    return true;
  }
  
  void baixarFiguresAbansDe(int numf){
    
    // Baixar files de 0 a numF-1
    for(int f=numf; f>0; f--){
      for(int c = 0; c < cells[f].length; c++){
        cells[f][c] = cells[f-1][c];
      }
    }
    
    // Buidar fila zero
    for(int c = 0; c < cells[0].length; c++){
        cells[0][c] = 0;
    }
    
  }
  
}
