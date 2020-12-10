Tauler t;

Figura f1, f2, f3, f4, f5, f6;
color c1, c2, c3, c4, c5, c6;

void setup(){
  
  size(800, 800);
  
  t = new Tauler(30,30);
  
  c1 = color(255,0,0);
  int[][] qf1 = {{0,1,0},
                 {0,1,0},
                 {0,1,1}};
                 
  f1 = new Figura(qf1, c1);
  f1.setPosicio(3,3);

                 
  f2 = new FiguraZ();
  f2.setPosicio(6,2);
  
  c3 = color(0,255,0);
  int[][] qf3 = {{1,1},
                 {1,1}};
                 
  f3 = new Figura(qf3, c3);
  f3.setPosicio(12,12);
  
  c4 = color(0, 0,255);
  int[][] qf4 = {{0,1,0},
                 {0,1,1},
                 {0,1,0}};
                 
  f4 = new Figura(qf4, c4);
  f4.setPosicio(18,12);
  
  c5 = color(255, 0,255);
  int[][] qf5 = {{0,1,1},
                 {1,1,0},
                 {0,0,0}};
                 
  f5 = new Figura(qf5, c5);
  f5.setPosicio(18,2);
  
  c6 = color(255, 50,255);
  int[][] qf6 = {{0,0,1,0},
                 {0,0,1,0},
                 {0,0,1,0},
                 {0,0,1,0}};
                 
  f6 = new Figura(qf6, c6);
  f6.setPosicio(8,12);
}


void draw(){
  
  t.dibuixa();
  t.reset();
  
  t.dibuixa(f1);
  t.aplica(f1);
  
  t.dibuixa(f2);
  t.aplica(f2);
  
  t.dibuixa(f3);
  t.aplica(f3);
  
  t.dibuixa(f4);
  t.aplica(f4);
  
  t.dibuixa(f5);
  t.aplica(f5);
  
  t.dibuixa(f6);
  t.aplica(f6);
}


void keyPressed(){
  if(keyCode==LEFT){
    f6.mouEsquerra(t);
  }
  else if(keyCode==RIGHT){
    f6.mouDreta(t);
  }
  else if(keyCode==DOWN){
    f6.mouBaix(t);
  }
  else if(key=='r' || key=='R'){
    f6.rota(t);
  }
}
