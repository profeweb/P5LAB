LlistaColorStock lcs;
color[] c = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), 
             color(255, 255, 0), color(255)};
             
int[] s = {10, 4, 8, 9, 0};

void setup(){
  size(800,800);
  
  lcs = new LlistaColorStock(5);
  lcs.setColors(c);
  lcs.setStocks(s);
}

void draw(){
  background(255);
  lcs.display(100,height/2, 50);
}
