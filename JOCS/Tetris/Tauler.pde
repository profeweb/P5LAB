

class Tauler {
  
  int numCols, numFils;
  
  float cellWidth, cellHeight;
  
  int[][] cells;
  
  
  Tauler(int nc, int nf){
    this.numCols = nc;
    this.numFils = nf;
    this.cellWidth = width/(float)numCols;
    this.cellHeight = height/(float)numFils;
    
    reset();
    
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
  
  void dibuixa(Figura fig){
    for(int f=0; f<fig.quadres.length; f++){
      for(int c=0; c<fig.quadres[0].length; c++){
        if(fig.quadres[f][c]==1){
          int ct = c + fig.col;
          int ft = f + fig.fila;
          fill(fig.c);
          stroke(0);
          rect(ct*cellWidth, ft*cellHeight, cellWidth, cellHeight);
        }
      } 
    }
  }
  
  
  
}
