
class Memory {
  
  // Mida de la memòria
  int mida;
  
  // Número de Processos dins memòria
  int numProcesos;
  // Procesos dins memòria
  Proces[] procesos;
  
  // Primera adreça lliure de la memòria
  int freeAddress;
  
  // Constructor
  Memory(int m){
    this.mida = m;
    procesos = new Proces[100];
    freeAddress = 0;
  }
  
  // Posa el procés dins memòria
  void swapIn(Proces p){
    
    if(this.freeAddress + p.mida < this.mida){
      procesos[numProcesos] = p;
      procesos[numProcesos].setAddress(this.freeAddress);
    
      this.numProcesos++;
      this.freeAddress += p.mida;
      
      println(frameCount+" : SWAP IN del Procés "+p.nom);
    }
    else {
      println(frameCount+" : ERROR SWAP IN del procés "+p.nom+"!!!!");
    }
        
  }
 
  // Lleva el procés de memòria
  void swapOut(Proces p){
    for(int i=0; i<numProcesos;i++){
      if(procesos[i] == p){
        procesos[i] = null;
        println(frameCount+" : SWAP OUT del Procés "+p.nom);
        break;
      }
    }
  }
  
  // Dibuixa la informació i el contingut de la memòria
  void display(){
    
    stroke(0); strokeWeight(3); fill(220);
    rect(100, 100, this.mida, 300);
    
    stroke(0); fill(0); textSize(20); textAlign(LEFT); textSize(30);
    text("Memòria RAM", 100, 60);
    
    textSize(20);
    text("Total: " + this.mida, 100, 480);
    
    int mo = calculaMemoriaOcupada();
    text("Ocupada: " + mo, 100, 540);
    
    int ml = this.mida - mo;
    text("Lliure: " + ml, 100, 580);
    
    int np = numProcesos();
    text("Num Procesos Actius: " + np, 100, 620);
    
    // Dibuixa els procesos dins memòria
    for(int i=0; i<numProcesos; i++){
      if(procesos[i]!=null){
        procesos[i].display(100, 100, 300);
      }
    }
  }
  
  // Calcula el total de memòria ocupada
  int calculaMemoriaOcupada(){
    int m = 0;
    for(int i=0; i<numProcesos; i++){
      if(procesos[i]!=null){
        m += procesos[i].mida;
      }
    }
    return m;
  }
  
  // Calcula quants processos hi ha en memòria
  int numProcesos(){
    int n = 0;
    for(int i=0; i<numProcesos; i++){
      if(procesos[i]!=null){
        n++;
      }
    }
    return n;
  }
  
}
