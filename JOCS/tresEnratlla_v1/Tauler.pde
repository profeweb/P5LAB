void creaTauler(){
  t = new Casella[3][3];
  
  for(int f=0; f<3; f++){
    for(int c=0; c<3; c++){
      t[f][c] = new Casella(f, c, c*width/3, f*height/3, width/3);
    }
  }
}

void dibuixaTauler(){
  for(int f=0; f<3; f++){
    for(int c=0; c<3; c++){
      t[f][c].display();
    }
  }
}

void escoltaTauler(){
  for(int f=0; f<3; f++){
    for(int c=0; c<3; c++){
      if(t[f][c].estaDins(mouseX,mouseY) && t[f][c].valor==0){
        t[f][c].setValor(numTirades%2 + 1);
        numTirades++;
      }
    }
  }
}

boolean guanyaFila(int f){
  return(t[f][0].valor==t[f][1].valor &&
     t[f][1].valor==t[f][2].valor && 
     t[f][0].valor!=0);
}

boolean guanyaCol(int c){
  return(t[0][c].valor==t[1][c].valor &&
     t[1][c].valor==t[2][c].valor && 
     t[0][c].valor!=0);
}

boolean guanyaDiagonal1(){
  boolean b = true;
  for(int d=0; d<t.length-1; d++){
    b = b && (t[d][d].valor==t[d+1][d+1].valor);
  }
  return b && t[0][0].valor!=0;
}

boolean guanyaDiagonal2(){
  boolean b = true;
  for(int c=0, f=t.length-1; c<t.length-1; c++, f--){
    b = b && (t[f][c].valor==t[f-1][c+1].valor);
  }
  return b && t[t.length-1][0].valor!=0;
}
