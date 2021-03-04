
class Figura {
  
  int[][] quadres;
  
  int fila, col;
  int tipus;
  
  Figura(int[][] quadres, int t){
    this.quadres = copiaMatriu(quadres);
    this.tipus = t;
  }
  
  void setPosicio(int f, int c){
    this.fila = f;
    this.col = c;
  }
  
  void setTipus(int tipus){
    this.tipus = tipus;
  }
  
  int getMaxCol(){
    int maxc=0;
    for(int f=0; f<quadres.length; f++){
      for(int c=0; c<quadres[0].length; c++){
        if(quadres[f][c]==1 && c>maxc){
          maxc = c;
        }
      }
    }
    return maxc;
  }
  
  int getMaxFil(){
    int n=0;
    for(int f=0; f<quadres.length; f++){
      for(int c=0; c<quadres[0].length; c++){
        if(quadres[f][c]==1){
          n = f;
        }
      }
    }
    return n;
  }
  
  int getMinCol(){
    int minc=quadres[0].length;
    for(int f=0; f<quadres.length; f++){
      for(int c=0; c<quadres[0].length; c++){
        if(quadres[f][c]==1 && c<minc){
          minc=c;
        }
      }
    }
    return minc;
  }
  
  int getMinFil(){
    int n=0;
    for(int f=0; f<quadres.length; f++){
      for(int c=0; c<quadres[0].length; c++){
        if(quadres[f][c]==1){
          return f;
        }
      }
    }
    return n;
  }
  
  void borrarFila(int nf){
    
    int df = nf - this.fila;
    
    // Si és la fila superior
    if(nf==df){
      for(int c=0; c<quadres[0].length; c++){
        quadres[0][c] = 0;
      }
    }
    else if(df>0 && df<quadres.length) {
      // Baixam totes les files superiors
      for(int f=df; f>0; f--){
        for(int c=0; c<quadres[f].length; c++){
          quadres[df][c] = quadres[df-1][c];
        }
      }
      // Buidam la 1era fila
      for(int c=0; c<quadres[0].length; c++){
        quadres[0][c] = 0;
      }
    }
  }
  
  boolean posicioLliure(Tauler t, int ff, int cf){
    for(int f=0; f<quadres.length; f++){
      for(int c=0; c<quadres[0].length; c++){
        //println("MIRANT FILA: "+(ff+f)+", I COL:"+(cf+c));
        if(quadres[f][c]!=0 && t.cells[ff+f][cf+c]!=0){
          //println("OCUPADA");
          return false;
        }
      }
    }
    return true;
  }
  
  void mouEsquerra(Tauler t){
    if(this.col + this.getMinCol() > 0){
      //println("COL:"+this.col+",FILA: "+this.fila);
      
      int newCol = this.col - 1;
      
      println("COL DESTI:"+newCol);
      if(posicioLliure(t, this.fila, newCol)){
        println("SE POT MOURE");
        this.col--;
      }
    }
  }
  
  void mouDreta(Tauler t){
    if(this.col + this.getMaxCol() < t.numCols - 1){
      this.col++;
    }
  }
  
  boolean mouBaix(Tauler t){
    
    if(this.fila + this.getMaxFil() < t.numFils - 1){
      int newFila = this.fila + 1;
      if(posicioLliure(t, newFila, this.col)){
        this.fila++;
        return true;
      }
    }
    return false;
  }
  
  void mouTopeBaix(Tauler t){
    while(mouBaix(t));
  }
  
  void rota(){
    
    int[][] q = this.copia();
    
    for(int f=0; f<quadres.length; f++){
      for(int c=0; c<quadres[0].length; c++){
        quadres[f][c]=q[quadres.length - c -1][f];
      }
    }
  }
  
  
  int[][] copia(){
    
    int[][] q = new int[this.quadres.length][this.quadres[0].length];
    for(int f=0; f<quadres.length; f++){
      for(int c=0; c<quadres[0].length; c++){
        q[f][c] = quadres[f][c];
      }
    }
    return q;
  }
  

}
