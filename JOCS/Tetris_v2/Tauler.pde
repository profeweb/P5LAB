

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
  
  
  void reset(){
    cells = new int[numFils][numCols];
    for(int c=0; c<numCols; c++){
      for(int f=0; f<numFils; f++){
        cells[f][c]=0;
      }
    }
  }
  
  
  void dibuixa(){
    for(float c=0; c<numCols; c++){
      for(float f=0; f<numFils; f++){
        fill(255);
        stroke(0);
        rect(c*cellWidth, f*cellHeight, cellWidth, cellHeight);
      } 
    }
  }
  
  void dibuixaCelles(){
    for(int c=0; c<numCols; c++){
      for(int f=0; f<numFils; f++){
        fill(255);
        if(cells[f][c]==1){
          fill(55);
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
          this.cells[ft][ct] = 1;
        }
      } 
    }
  }
  
  void aplicaFigures(){
    reset();
    for(Figura f : figures){
      aplica(f);
    }
  }
  
  void dibuixaFigures(){
    for(Figura f : figures){
      dibuixa(f);
    }
  }
  
  void dibuixa(Figura fig){
    for(int f=0; f<fig.quadres.length; f++){
      for(int c=0; c<fig.quadres[0].length; c++){
        int ct = c + fig.col;
        int ft = f + fig.fila;
        if(fig.quadres[f][c]==1){
          fill(fig.c);
          stroke(0);
        }
        else{
          fill(100, 50);
        }
        rect(ct*cellWidth, ft*cellHeight, cellWidth, cellHeight);
      } 
    }
  }
  
}
