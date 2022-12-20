// Models 3D
PShape body, head, arm, leg, foot, hand;

// Sliders
Slider rBodyY, rArmX, rArmY, rArmZ;

void setup(){ 
  size(1400, 900, P3D); 
  smooth(); frameRate(30);
  
  // Carrega els models 3D
  body = loadShape("body.obj");
  head = loadShape("head.obj");
  arm = loadShape("arm.obj");
  leg = loadShape("leg.obj");
  foot = loadShape("foot.obj");
  hand = loadShape("hand.obj");
  
  //Crea els sliders
  rBodyY = new Slider("BODY ROT Y", 100, 100, 300, 50, 0, 360, 0);
  rArmX  = new Slider("ARMR ROT X", 100, 200, 300, 50, 0, 360, 0);
  rArmY  = new Slider("ARMR ROT Y", 100, 300, 300, 50, 0, 360, 0);
  rArmZ  = new Slider("ARMR ROT Z", 100, 400, 300, 50, 0, 360, 0);
} 


void draw() { 
  lights(); 
  background(150);
  
  // Mostra el maniquí
  pushMatrix();
  translate(width/2, height/2.5, -50);
  sphere(10);
  displayBody();
  popMatrix();
  
  // Mostra els sliders
  rBodyY.display();
  rArmX.display();
  rArmY.display();
  rArmZ.display();
}

void displayBody(){
  pushMatrix();
  rotateZ(-PI);
  translate(0,0,0);
  rotateY(radians(rBodyY.v));
  scale(50);
  shape(body);
  displayHead(0,0,0);
  displayLeftArm(0,0,PI/2);
  displayRightArm(radians(rArmX.v),radians(rArmY.v),radians(rArmZ.v));
  displayLeftLeg(0,0,PI/6);
  displayRightLeg(0,0,-PI/10);
  popMatrix();
}

void displayHead(float angX, float angY, float angZ){
  pushMatrix();
  translate(0, 2.5, 0);
  rotateX(angX);
  rotateY(angY);
  rotateZ(angZ);
  shape(head);
  popMatrix();
}

void displayLeftArm(float angX, float angY, float angZ){
  pushMatrix();
  translate(+1.1, 1.75, 0);
  rotateX(angX);
  rotateY(angY);
  rotateZ(angZ);
  shape(arm);
  displayLeftHand(0,0,0);
  popMatrix();
}

void displayLeftHand(float angX, float angY, float angZ){
  pushMatrix();
  translate(0, -2.65, 0);
  rotateX(angX);
  rotateY(angY);
  rotateZ(angZ);
  shape(hand);
  popMatrix();
}


void displayRightArm(float angX, float angY, float angZ){
  pushMatrix();
  translate(-1.1, 1.75, 0);
  rotateX(angX);
  rotateY(angY);
  rotateZ(angZ);
  shape(arm);
  displayRightHand(0,0,0);
  popMatrix();
}

void displayRightHand(float angX, float angY, float angZ){
  pushMatrix();
  translate(0, -2.65, 0);
  rotateX(angX);
  rotateY(angY);
  rotateZ(angZ);
  shape(hand);
  popMatrix();
}


void displayLeftLeg(float angX, float angY, float angZ){
  pushMatrix();
  translate(+0.5, -1.85, 0);
  rotateX(angX);
  rotateY(angY);
  rotateZ(angZ);
  shape(leg);
  displayLeftFoot(0,0,0);
  popMatrix();
}

void displayLeftFoot(float angX, float angY, float angZ){
  pushMatrix();
  translate(0, -3.5, 0);
  rotateX(angX);
  rotateY(angY);
  rotateZ(angZ);
  shape(foot);
  popMatrix();
}



void displayRightLeg(float angX, float angY, float angZ){
  pushMatrix();
  translate(-0.5, -1.85, 0);
  rotateX(angX);
  rotateY(angY);
  rotateZ(angZ);
  shape(leg);
  displayRightFoot(0,0,0);
  popMatrix();
}

void displayRightFoot(float angX, float angY, float angZ){
  pushMatrix();
  translate(0, -3.5, 0);
  rotateX(angX);
  rotateY(angY);
  rotateZ(angZ);
  shape(foot);
  popMatrix();
}


void mousePressed(){
  // Comprova el click sobre la gui (sliders)
  if (rBodyY.mouseOnSlider()) {
      rBodyY.updateSlider();
  }
  else if (rArmX.mouseOnSlider()) {
      rArmX.updateSlider();
  }
  else if (rArmY.mouseOnSlider()) {
      rArmY.updateSlider();
  }
  else if (rArmZ.mouseOnSlider()) {
      rArmZ.updateSlider();
  }
}

void mouseDragged(){
  // Comprova els drag sobre la gui (sliders)
  if (rBodyY.mouseOnSlider()) {
      rBodyY.updateSlider();
  }
  else if (rArmX.mouseOnSlider()) {
      rArmX.updateSlider();
  }
  else if (rArmY.mouseOnSlider()) {
      rArmY.updateSlider();
  }
  else if (rArmZ.mouseOnSlider()) {
      rArmZ.updateSlider();
  }
}
