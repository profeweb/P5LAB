PShape body, head, arm, leg, foot, hand;

void setup(){ 
  size(900, 900, P3D); 
  smooth(); frameRate(30);
  body = loadShape("body.obj");
  head = loadShape("head.obj");
  arm = loadShape("arm.obj");
  leg = loadShape("leg.obj");
  foot = loadShape("foot.obj");
  hand = loadShape("hand.obj");
} 


void draw() { 
  lights(); 
  background(50);
  
  pushMatrix();
  translate(width/2, height/2.5, -50);
  sphere(10);
  displayBody();
  popMatrix();
}

void displayBody(){
  pushMatrix();
  //rotateY(PI/2);
  rotateZ(-PI);
  translate(0,0,0);
  scale(50);
  shape(body);
  displayHead(0,0,0);
  displayLeftArm(0,0,PI/2);
  displayRightArm(0,0,-PI/2);
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

}

void mouseDragged(){

}
