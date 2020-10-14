
class Memory {
  
  // Mida de la memòria
  int mida;
  
  // Número de Processos dins memòria
  int numProcesos;
  // Procesos dins memòria
  Proces[] procesos;
  
  int numHoles;
  Hole[] holes;
  
 
  // Constructor
  Memory(int m){
    
    this.mida = m;
    
    numProcesos = 0;
    procesos = new Proces[100];
    
    numHoles = 0;
    holes = new Hole[100];
    addHole(0, this.mida);
    
  }
  
  // Posa el procés dins memòria
  void swapIn(Proces p){
    
    boolean swapped = false;
    
    for(int i=0; i<numHoles && !swapped; i++){
      
      if(holes[i]!=null && holes[i].mida>=p.mida){
        
        int espairestant = holes[i].mida - p.mida;
        
        procesos[numProcesos] = p;
        procesos[numProcesos].setAddress(holes[i].address);
        
        this.numProcesos++;
        swapped = true;
        println(frameCount+" : SWAP IN del Procés "+p.nom);
                
        holes[i].address = holes[i].address + p.mida;
        holes[i].mida = espairestant;
        if(holes[i].mida==0){
          holes[i] = null;
        }
      }
    }
    
    if(!swapped) {
      println(frameCount+" : ERROR SWAP IN del procés "+p.nom+"!!!!");
    }
        
  }
 
  // Lleva el procés de memòria
  void swapOut(Proces p){
    
    for(int i=0; i<numProcesos;i++){
      if(procesos[i] == p){
        
        procesos[i] = null;
        println(frameCount+" : SWAP OUT del Procés "+p.nom);
        
        addHole(p.address, p.mida);
        
        break;
      }
    }
  }
  
  // Afegir forat
  void addHole(int a, int m){
    holes[numHoles] = new Hole(a, m);
    System.out.println("NEW HOLE");
    numHoles++;
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
    
    int nh = numForats();
    text("Num Forats: " + nh, 100, 660);
    
    // Dibuixa els procesos dins memòria
    for(int i=0; i<numProcesos; i++){
      if(procesos[i]!=null){
        procesos[i].display(100, 100, 300);
      }
    }
    
    // Dibuixa els forats dins memòria
    for(int i=0; i<numHoles; i++){
      if(holes[i]!=null){
        holes[i].display(100, 100, 300);
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
  
  // Calcula quants forats hi ha en memòria
  int numForats(){
    int n = 0;
    for(int i=0; i<numHoles; i++){
      if(holes[i]!=null){
        n++;
      }
    }
    return n;
  }
  
}
