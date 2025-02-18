int r=180, g=55, b=25;

void setup() { 
  size(800, 500, P3D);
} 

void draw() { 
  background(0);
  
  setView();
  setLight();
  
  translate(-240, -100, 0);
  showPlane();
  
  translate(240, 0, 0);
  showBox();
  
  translate(240, 0, 0);
  showCylinder();
  
  translate(-240 * 2, 200, 0);
  showCone();
  
  translate(240, 0, 0);
  showTorus();
  
  translate(240, 0, 0);
  showSphere();
}

void setLight(){
  if(keyPressed){
    if(key=='r'){
      r = 255; g=0; b=0;
    }
    else if(key=='g'){
      r = 0; g=255; b=0;
    }
    else if(key=='b'){
      r = 0; g=0; b=255;
    }
  }
  ambientLight(r, g, b);
  pointLight(200, 200, 200, 0, 0, 0);
}

void setView(){
  if(keyPressed){
    if(key=='c'){
      camera(100, 50, 300);
    }
    else if(key=='p'){
      perspective(PI/5,2,0,400);
    }
    else if(key=='o'){
      ortho(-400,400,-400,400,0,800);
    }
  }
}

void showPlane(){
  push();
    rotateZ(frameCount * 0.01);
    rotateX(frameCount * 0.01);
    rotateY(frameCount * 0.01);
    plane(70);
  pop();
}

function showBox(){
  push();
  rotateZ(frameCount * 0.01);
  rotateX(frameCount * 0.1);
  rotateY(frameCount * 0.01);
  box(70, 70, 70);
  pop();
}

void showCylinder(){
  push();
  rotateZ(frameCount * 0.01);
  rotateX(-frameCount * 0.01);
  rotateY(-frameCount * 0.01);
  cylinder(70, 70);
  pop();
}

void showCone(){
  push();
  rotateZ(frameCount * 0.01);
  rotateX(frameCount * 0.01);
  rotateY(frameCount * 0.01);
  cone(50, 100);
  pop();
}

void showTorus(){
  push();
  rotateZ(frameCount * 0.01);
  rotateX(frameCount * 0.01);
  rotateY(frameCount * 0.1);
  torus(70, 20);
  pop();
}

void showSphere(){
  push();
  rotateZ(frameCount * 0.01);
  rotateX(frameCount * 0.01);
  rotateY(frameCount * 0.01);
  sphere(70);
  pop();
}
