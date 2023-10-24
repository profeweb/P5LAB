
import peasy.*;

PeasyCam cam;

Poligon pBase;
Poligon[] ps;

String vista ="FRONT";
int numSides = 4;
int num = 50;
float s = 200;
float amtY = -20;
float angStep = 5;

void setup(){
  size(1400, 1000, P3D);
  cam = new PeasyCam(this, 1200);
  pBase = createPoligon(numSides, new PVector(0, 0, 0), s);
  createPoligons(num, pBase, amtY, angStep);
}

Poligon createPoligon(int numSides, PVector c, float radius){
  PVector[] vs = new PVector[numSides];
  float ang = 0;
  float angStep = TWO_PI / numSides;
  for(int i=0; i<numSides; i++){
    float x = c.x + radius*cos(ang);
    float y = 0;
    float z = c.y + radius*sin(ang);
    vs[i] = new PVector(x, y, z);
    ang += angStep;
  }
  return new Poligon(vs);
}


PVector translatePointY(PVector p, float amtY){
  float yt = p.y + amtY;
  return new PVector(p.x, yt, p.z);
}

PVector rotatePointY(PVector p, PVector c, float ang){
  float xr = c.x + (p.x - c.x)*cos(ang) - (p.z - c.z)*sin(ang);
  float zr = c.y + (p.x - c.x)*sin(ang) + (p.z - c.z)*cos(ang);
  return new PVector(xr, p.y, zr);
}

Poligon translateRotate(Poligon p, float amtY, float ang){
  PVector[] vertexsTR = new PVector[p.vertexs.length];
  PVector centroid = p.getCentroid().copy();
  for(int i=0; i<p.vertexs.length; i++){
    PVector temp = rotatePointY(p.vertexs[i], centroid, radians(ang));
    vertexsTR[i] = translatePointY(temp, amtY);
  }
  return new Poligon(vertexsTR);
}

void createPoligons(int n, Poligon pOrig, float yStep, float angStep){
  ps = new Poligon[n];
  float y = yStep;
  float ang = angStep;
  for(int i=0; i<n; i++){
    ps[i] = translateRotate(pOrig, y, ang);
    y += yStep;
    ang += angStep;
  }
}

void parets(){
  for(int i=0; i<ps.length-1; i++){
    Poligon p0 = ps[i];
    Poligon p1 = ps[i+1];
    int nv = p0.vertexs.length;
    strokeWeight(2);
    for(int v=0; v<nv; v++){
      beginShape();
      vertex(p0.vertexs[v].x, p0.vertexs[v].y, p0.vertexs[v].z); 
      vertex(p0.vertexs[(v+1)%nv].x, p0.vertexs[(v+1)%nv].y, p0.vertexs[(v+1)%nv].z); 
      vertex(p1.vertexs[(v+1)%nv].x, p1.vertexs[(v+1)%nv].y, p1.vertexs[(v+1)%nv].z); 
      vertex(p1.vertexs[v].x, p1.vertexs[v].y, p1.vertexs[v].z); 
      endShape(CLOSE);
    }
  }
}

void displayInfo(){
    cam.beginHUD();
    fill(0);
    textSize(24);
    text("VISTA "+vista, 20, 50);
    text("Num Sides: "+ numSides, 20, 100);
    text("Y Step: "+ amtY, 20, 140);
    text("Ang Step: "+ angStep, 20, 180);
  cam.endHUD();
}

void displayEdifici(){
  pBase.display(color(255, 0, 0), color(255, 0, 0));
  
  for(Poligon p : ps){
    p.display(color(0), color(255));
  }
  
  parets();
}

void draw(){
  background(215);
  
  displayInfo();
  
  
  if(vista=="FRONT"){
  translate(0, 500, 0);
  }
  else if(vista=="TOP"){
    translate(0,0, -500);
    rotateX(-PI/2);
  }
  else if(vista=="LATERAL"){
    translate(width/3,0,0);
    rotateZ(-PI/2);
  }
  
  displayEdifici();
}


void keyPressed(){
  if(key=='F' || key=='f'){
    vista = "FRONT";
  }
  else if(key=='T' || key=='t'){
    vista = "TOP";
  }
  else if(key=='L' || key=='l'){
    vista = "LATERAL";
  }
  else if(key=='P' || key=='p'){
    saveFrame("edifici-poliedric-####.jpg");
  }
  else if(keyCode == UP){
    numSides++;
    pBase = createPoligon(numSides, new PVector(0, 0, 0), s);
    createPoligons(num, pBase, amtY, angStep);
  }
  else if(keyCode == DOWN){
    numSides--;
    pBase = createPoligon(numSides, new PVector(0, 0, 0), s);
    createPoligons(num, pBase, amtY, angStep);
  }
  else if(keyCode == LEFT){
    angStep--;
    pBase = createPoligon(numSides, new PVector(0, 0, 0), s);
    createPoligons(num, pBase, amtY, angStep);
  }
  else if(keyCode == RIGHT){
    angStep++;
    pBase = createPoligon(numSides, new PVector(0, 0, 0), s);
    createPoligons(num, pBase, amtY, angStep);
  }
}
