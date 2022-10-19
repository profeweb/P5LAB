
class Scheduler {
    
  // Número de Processos dins memòria
  int numProcesos;
  
  // Procesos dins memòria
  Proces[] procesos;
  
  
  // Constructor
  Scheduler(int m){
    this.numProcesos = 0;
    procesos = new Proces[m];
  }
  
  void add(Proces p){
    if(numProcesos < procesos.length){
      procesos[numProcesos] = p;
      numProcesos++;
    }
  }
  
  
  void roundRobin(int quantum){
    if(numProcesos>0){
      
      Proces p = procesos[0];
      p.run(quantum);
      
      for(int i=1; i<numProcesos; i++){
        if(procesos[i]!=null){
          procesos[i-1] = procesos[i];
        }
      }
      if(p.numExecs < p.numCicles){
        procesos[numProcesos-1] = p;
      }
      else {
        procesos[numProcesos-1] = null;
        numProcesos--;
      }
    }
  }
  
  
  // Dibuixa la informació i el contingut de la memòria
  void display(float x, float y, float w, float h){
    
    stroke(0); strokeWeight(3); fill(220);
    rect(x, y, w, h);
    
    stroke(0); fill(0); textSize(20); textAlign(LEFT); textSize(30);
    text("Scheduler", 100, 60);
    
    textSize(20);
    
    int np = numProcesos();
    text("Num Procesos Actius: " + np, 100, 620);
    
    // Dibuixa els procesos dins memòria
    for(int i=0; i<procesos.length; i++){
      fill(0); textAlign(CENTER);
      text(i, x + w - i*100 + 50, y-10);
      fill(220);
      rect(x + w - i*100, y, 100, h);
      if(procesos[i]!=null){
        procesos[i].display(x + w - i*100, y, 100, h);
      }
    }
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
