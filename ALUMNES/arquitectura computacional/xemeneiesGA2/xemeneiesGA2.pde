import peasy.*;

PeasyCam cam;

Xemeneia[][] x;

int numFiles = 3;
int numCols = 6;
int filaSel = 0, colSel =0;

float h, w;

void setup(){
  
  size(1800, 800, P3D);
  cam = new PeasyCam(this, 450);
  x = new Xemeneia[numFiles][numCols];
  creaXemeneies();
  
  h = 450;
  w = 350;

}

void draw(){
  background(200);
  pushMatrix();
  translate(- w*numCols/2, 0, 0);
  for(int f=0; f<x.length; f++){
    for(int c=0; c<x[f].length; c++){
      stroke(0);
      if(filaSel==f && colSel==c){
        stroke(255, 0, 0);
      }
      x[f][c].display(w*c, h*f, -0);
    }
  }
  popMatrix();
  
  pushMatrix();
    translate(- width, height/2, -100);
    scale(2);
    stroke(255, 0, 0);
    x[filaSel][colSel].display(0, 0, 0);
    fill(0); textSize(24);
    text("AMP BASE: "+ x[filaSel][colSel].ampleBase, -100, 50);
    text("ALT BASE: "+ x[filaSel][colSel].altBase, -100, 100);
    text("AMP MID: "+ x[filaSel][colSel].ampleMid, -100, 150);
    text("AMP TOP: "+ x[filaSel][colSel].ampleTop, -100, 200);
    text("ALT TOP: "+ x[filaSel][colSel].altTop, -100, 250);
  popMatrix();
}

void creaXemeneies(){
  x = new Xemeneia[numFiles][numCols];
    for(int f=0; f<x.length; f++){
      for(int c=0; c<x[f].length; c++){
        float ampB = random(50, 200);
        float altB = random(50, 200);
        float ampM = random(50, 200);
        float ampT = random(50, 200);
        float altT = random(50, 200);
        x[f][c] = new Xemeneia(ampB, altB, ampM, ampT, altT);
      }
    }
}

void keyPressed(){
  
  if(keyCode==ENTER){
    creaXemeneies();
  }
  else if(keyCode==UP){
    filaSel--;
    filaSel = constrain(filaSel, 0, x.length-1);
  }
  else if(keyCode==DOWN){
    filaSel++;
    filaSel = constrain(filaSel, 0, x.length-1);
  }
  else if(keyCode==LEFT){
    colSel--;
    colSel = constrain(colSel, 0, x[0].length-1);
  }
  else if(keyCode==RIGHT){
    colSel++;
    colSel = constrain(colSel, 0, x[0].length-1);
  }
}
