
Arbre a;

void setup(){
  size(1400, 900);
  
  a = new Arbre();
  for(int i=0; i<15; i++){
    a.addElement((int)random(100));
  }
  
  println("INORDRE: ");
  a.arrel.inordre();
  println("\nPREORDRE: ");
  a.arrel.preordre();
  println("\nPOSTORDRE: ");
  a.arrel.postordre();
  println();
  println("\nRERVERS: ");
  a.arrel.revers();
  println();
}

void draw(){
  background(200, 100, 100);
  a.display(a.arrel, width/2, 100, 50, 0);
}

void mousePressed(){
  a = new Arbre((int)random(100));
  for(int i=0; i<15; i++){
    a.addElement((int)random(100));
  }
}

void keyPressed(){
  if(key=='i' || key=='I'){
    println("\nINORDRE: ");
    a.arrel.inordre();
  }
  else if(key=='e' || key=='E'){
    println("\nPREORDRE: ");
    a.arrel.preordre();
  }
  else if(key=='o' || key=='O'){
    println("\nPROSTORDRE: ");
    a.arrel.postordre();
  }
  else if(key=='r' || key=='r'){
    println("\nREVERS: ");
    a.arrel.revers();
  }
  else if(key=='f' || key=='F'){
    int nf = (int)random(0, 100);
    boolean b = a.cercaElement(nf, a.arrel);
    println(nf +" "+ (b?"Sí":"No") + " està a l'arbre.");
  }
  else if(key=='b' || key=='B'){
    println("\nBFS: ");
    int nf = (int)random(0, 100);
    a.bfsArbre(a.arrel, nf);
  }
  else if(key=='M'){
    int nf = a.getMaxim();
    println("MÀXIM: "+nf);
  }
  else if(key=='m'){
    int nf = a.getMinim();
    println("MÍNIM: "+nf);
  }
}
