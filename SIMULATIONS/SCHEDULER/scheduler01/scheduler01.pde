// Scheduler
Scheduler s;

// Processos
ArrayList<Proces> ps;
Proces p0, p1, p2, p3, p4;

int framesClock = 60;

void setup(){
  
  size(1400,800);
  
  s = new Scheduler(8);
  
  ps = new ArrayList();
  
  p0 = new Proces("PO", color(0,0,255), 12);
  p1 = new Proces("P1", color(255, 0, 0), 6);
  p2 = new Proces("P2", color(255, 255, 0), 8);
  p3 = new Proces("P3", color(255, 0, 255), 5);
  p4 = new Proces("P4", color(0, 255, 255), 14);
}


void draw(){
  
  background(255);
  
  // Visualitzam el contingut de la coa de planificació
  s.display(200, 100, 600, 300);
  
  //
  llistaProcesos(ps);
  
  if(frameCount==30/framesClock){
    s.add(p0);
    ps.add(p0);
  }
  if(frameCount==120/framesClock){
    s.add(p1);
    ps.add(p1);
  }
  if(frameCount==180/framesClock){
    s.add(p2);
    ps.add(p2);
  }
  if(frameCount==300/framesClock){
    s.add(p3);
    ps.add(p3);
  }
  if(frameCount==360/framesClock){
    s.add(p4);
    ps.add(p4);
  }
  
  if(frameCount%framesClock==0){
    s.roundRobin(3);
  }
 
  
}

void llistaProcesos(ArrayList<Proces>ps){
  for(int i=0; i<ps.size(); i++){
    Proces p= ps.get(i);
    fill(p.c);
    rect(1100, 100 + i*60, 50, 50);
    fill(0); textSize(24);
    text(p.nom, 1180, 100 + i*60 + 30);
    textSize(18);
    text(p.numExecs +" /" +p.numCicles, 1250, 100 + i*60 + 30);
  }
}
