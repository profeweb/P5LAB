void creaTauler(){
  t = new Casella[3][3];
  for(int f=0; f<t.length; f++){
    for(int c=0; c<t[f].length; c++){
      t[f][c] = new Casella(f, c, (width/3)*c, (height/3)*f, width/3);
    }
  }
}


void dibuixaTauler(){
  for(int f=0; f<t.length; f++){
    for(int c=0; c<t[f].length; c++){
      t[f][c].display();
    }
  }
}

void escoltaTauler(){
  for(int f=0; f<t.length; f++){
    for(int c=0; c<t[f].length; c++){
      if(t[f][c].estaDins(mouseX, mouseY) && t[f][c].valor==0){
        t[f][c].setValor(numTirades%2 + 1);
        numTirades++;
      }
    }
  }
}

boolean guanyaFila(int f){
  return t[f][0].valor==t[f][1].valor && 
         t[f][1].valor==t[f][2].valor && 
         t[f][0].valor!=0;
}

boolean guanyaCol(int c){
  return t[0][c].valor==t[1][c].valor && 
         t[1][c].valor==t[2][c].valor && 
         t[0][c].valor!=0;
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

  for(int d=0, c= 0, f=t.length-1; d<t.length-1; d++, f--, c++){
    b = b && (t[f][c].valor==t[f-1][c+1].valor);
  }
  return b && t[t.length-1][0].valor!=0;
}

boolean guanyaFiles(){
  boolean b = false;
  for(int f=0; f<t.length; f++){
   b = b || guanyaFila(f);
  }
  return b;
}

boolean guanyaCols(){
  boolean b = false;
  for(int c=0; c<t.length; c++){
   b = b || guanyaCol(c);
  }
  return b;
}
