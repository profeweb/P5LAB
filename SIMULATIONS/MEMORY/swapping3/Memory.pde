
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
    System.out.println("NOU FORAT a Adreça: "+a+" de mida: "+m);
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
  
  void compacta(){
    
    println(frameCount+": Inici de la Compactació de Memòria");
    
    int minHole;
    int possible;
    
    do {
      
      minHole = getHoleMinAddress();
      Hole h = holes[minHole];
      println(".... Forat amb adreça menor: "+h.address);
      
      possible = getProcesMinAddress(h.address, h.mida);
      
      if(possible!=-1){
        Proces p = procesos[possible];
        println(".... Procés amb possibilitat de moure's:"+p.nom);
        mouProces(p, minHole);
      }
      
    } while(possible!=-1);
    
    println("...Compactant els forats");
    boolean compactable;
    int nh1=-1, nh2=-1;
    do {
      compactable = false;
      for(int i=0; i<numHoles; i++){
        for(int j=0; j<numHoles; j++){
          if(i!=j && holes[i]!=null && holes[j]!=null){
            Hole h1 = holes[i];
            Hole h2 = holes[2];
            if ((h1.address+h1.mida == h2.address) ||
               (h2.address+h2.mida == h1.address)){
                 compactable =true;
                 nh1 = i; nh2 = j;
               }
          }
        }
      }
      if(compactable){
        compactaForats(nh1, nh2);
      }
    } while(compactable);
    
    println(frameCount+": Final de la Compactació");
    
  }
  
  void compactaForats(int n1, int n2){
    
    println("Compactanta els forats "+n1+" i "+n2);

    if(holes[n1].address < holes[n2].address){
      holes[n1].mida = holes[n1].mida + holes[n2].mida;
      holes[n2] = null;
    }
    else {
      holes[n2].mida = holes[n2].mida + holes[n1].mida;
      holes[n1] = null;
    }
  }
  
  // Retorna el número de forat amb adreça més petita
  int getHoleMinAddress(){

    int minAddress = this.mida;
    int num = -1;

    for(int i=0;i<numHoles; i++){
      if(holes[i]!=null && holes[i].address < minAddress){
        minAddress = holes[i].address;
        num = i;
      }
    }
    
    return num;
    
  }
  
  
  // Retorna el número de Procés amb l'adreça de memòria més petita
  int getProcesMinAddress(int posterior, int midaMinima){
    
    int minAddress = this.mida;
    int num = -1;

    for(int i=0;i<numProcesos; i++){
      if(procesos[i]!=null && 
         procesos[i].address < minAddress &&
         procesos[i].address >= posterior &&
         procesos[i].mida <= midaMinima){
        minAddress = procesos[i].address;
        num = i;
      }
    }
    
    return num;
  }
  
  void mouProces(Proces p, int nH){
    
    Hole h = holes[nH];
    println("MOVENT Procés "+p.nom+" al forat "+h.address);
    
    int oldAddress = p.address;      // Adreça del procés
    p.address = h.address;           // Nova adreça del procés
    
    h.address  = p.address + p.mida; // Nova adreça del forat
    h.mida = h.mida - p.mida;        // Nova mida del forat

    if(h.mida==0){
      holes[nH] = null;  // Si la mida és zero, eliminam el forat
    }
    
    addHole(oldAddress, p.mida);  // Afegim forat on era el procés
    
  }
    
}
