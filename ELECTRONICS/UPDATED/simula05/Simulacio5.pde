import cc.arduino.*;

class Simulacio05 extends Simulacio {

  // Controlador arduino
  Arduino arduino;

  // Models 3D de les parts
  PShape L1, L2, L3, L4, base; 

  int front_right_link = 0;
  int front_left_link= 0;
  int back_right_link = 0;
  int back_left_link= 0;

  // Valors de la rotació
  float X_Rotation = 0.0;
  float Y_Rotation = 0.0;
  float Z_Rotation = 0.0;

  //Sliders de la gui
  Slider sX, sY, sZ;
  Slider sFR, sFL, sBR, sBL;

  // Constructor
  Simulacio05(PApplet p) {
    super(p);
    initPins(p);
    initGui();
  }

  // Inicialitza els pins de l'Arduino
  void initPins(PApplet p) {
    //arduino = new Arduino(p, "/dev/ttyACM0", 57600);
    for (int i = 0; i <= 13; i++) {
      //arduino.pinMode(i, Arduino.OUTPUT);
    }
  }

  // Inicialitza els elements GUI
  void initGui() {

    // Formes 3D
    L1 = loadShape("linkone.obj");
    L2= loadShape("linktwo.obj");
    L3= loadShape("linkthree.obj");
    L4= loadShape("linkfour.obj");
    base =loadShape("base.obj");

    // Sliders
    sX = new Slider("X_Rotation", 50, 50, 300, 50, 0, 6.28, 0);
    sY = new Slider("Y_Rotation", 50, 150, 300, 50, 0, 6.28, 0);
    sZ = new Slider("Z_Rotation", 50, 250, 300, 50, 0, 6.28, 0);

    sFR = new Slider("Front_Right_Link", 450, 50, 300, 50, 0, 50, 0);
    sFR.setColor(color(100, 100, 255));
    sFL = new Slider("Front_Left_link", 450, 150, 300, 50, 0, 50, 0);
    sFL.setColor(color(100, 100, 255));

    sBR = new Slider("Back_Right_Link", 850, 50, 300, 50, 0, 50, 0);
    sBR.setColor(color(100, 100, 255));
    sBL = new Slider("Back_Left_link", 850, 150, 300, 50, 0, 50, 0);
    sBL.setColor(color(100, 100, 255));
  }


  // Dibuixa la gui
  void display() {
    pushMatrix();    
    translate(width/2 +100, 500); 
    //scale(2);
    rotateY(X_Rotation);  
    rotateX(Y_Rotation);
    rotateZ(Z_Rotation);
    displayRobotArm(); 
    popMatrix();

    // Dibuixa els sliders
    sX.display();
    sY.display();
    sZ.display();
    sFR.display();
    sFL.display();
    sBR.display();
    sBL.display();
  }

  // Actualitza els valors a l'Arduino
  void updateSerial() {
    arduino.analogWrite(8, (int)front_right_link);  
    arduino.analogWrite(9, (int)front_left_link);
    arduino.analogWrite(10, (int)back_right_link);  
    arduino.analogWrite(11, (int)back_left_link);
    delay(0);
  }


  void displayRobotArm() {
    //tail starts here
    pushMatrix();
    rotateZ(radians(-back_right_link));
    fill(210, 72, 0);
    ellipse(0, 0, 20, 20);
    translate(-3, -10, 0);
    rect(0, 0, 100, 20);
    translate(100, 10, 0);
    ellipse(0, 0, 20, 20);

    rotateZ(radians((back_left_link)*0.625));
    rotateZ(radians((back_right_link)));
    rotateZ(radians(11.5));
    fill(210, 72, 0);
    ellipse(0, 0, 20, 20);
    translate(-3, -10, 0);
    rect(0, 0, 150, 20);
    translate(150, 10, 0);
    ellipse(0, 0, 20, 20);

    popMatrix();

    pushMatrix();
    translate(0, 60, 0);
    rotateZ(radians(back_left_link));
    fill(210, 72, 0);
    ellipse(0, 0, 20, 20);
    translate(-3, -10, 0);
    rect(0, 0, 100, 20);
    translate(100, 10, 0);
    ellipse(0, 0, 20, 20);

    rotateZ(radians((-back_right_link)*0.625));  
    rotateZ(radians(-back_left_link));
    rotateZ(radians(-11.5));
    fill(210, 72, 0);
    ellipse(0, 0, 20, 20);
    translate(-3, -10, 0);
    rect(0, 0, 150, 20);
    translate(150, 10, 0);
    ellipse(0, 0, 20, 20);      

    popMatrix();

    //final tail begins
    pushMatrix();
    rotateZ(radians((-back_right_link)/2));  
    rotateZ(radians((back_left_link)/2));
    rotateZ(radians(5));
    translate(150, -10, 0);
    fill(255, 0, 255);
    ellipse(0, 0, 20, 20);
    translate(-3, -10, 0);
    rect(0, 0, 250, 20);
    translate(250, 10, 0);
    ellipse(0, 0, 20, 20);  
    popMatrix();

    pushMatrix();
    rotateZ(radians((back_left_link)/2));  
    rotateZ(radians((-back_right_link)/2));
    rotateZ(radians(-5));
    translate(150, 65, 0);
    fill(255, 0, 255);
    ellipse(0, 0, 20, 20);
    translate(-3, -10, 0);
    rect(0, 0, 250, 20);
    translate(250, 10, 0);
    ellipse(0, 0, 20, 20);  
    popMatrix();
    //tail ends here

    //head starts here
    pushMatrix();
    translate(-350, 0, 0);
    pushMatrix();
    rotateZ(radians(front_right_link));
    fill(255, 255, 0);
    ellipse(0, 0, 20, 20);
    translate(-3, -10, 0);
    rect(0, 0, -100, 20);
    translate(-100, 10, 0);
    ellipse(0, 0, 20, 20);

    rotateZ(radians((-front_left_link)*0.75));
    rotateZ(radians((-front_right_link)));
    rotateZ(radians(-14));
    fill(255, 255, 0);
    ellipse(0, 0, 20, 20);
    translate(-3, -10, 0);
    rect(0, 0, -125, 20);
    translate(-125, 10, 0);
    ellipse(0, 0, 20, 20);

    popMatrix();

    pushMatrix();
    translate(0, 60, 0);
    rotateZ(radians(-front_left_link));
    fill(255, 255, 0);
    ellipse(0, 0, 20, 20);
    translate(-3, -10, 0);
    rect(0, 0, -100, 20);
    translate(-100, 10, 0);
    ellipse(0, 0, 20, 20);

    rotateZ(radians((front_right_link)*0.75));  
    rotateZ(radians(front_left_link));
    rotateZ(radians(14));
    fill(255, 255, 0);
    ellipse(0, 0, 20, 20);
    translate(-3, -10, 0);
    rect(0, 0, -125, 20);
    translate(-125, 10, 0);
    ellipse(0, 0, 20, 20);
    popMatrix();
    popMatrix();
    //head ends here

    //body begins here
    //left body
    pushMatrix();
    translate(-350, 0, 0);
    rotateZ(radians((front_right_link)/2));  
    rotateZ(radians((back_right_link)/2));
    rotateZ(radians(166));
    fill(0, 255, 255);
    ellipse(0, 0, 20, 20);
    translate(-3, -10, 0);
    rect(0, 0, -175, 20);
    translate(-175, 10, 0);
    ellipse(0, 0, 20, 20);
    translate(87.5, 10, 0);
    rotateZ(radians(-90));
    rect(0, 0, -87.5, 20);
    translate(-87.5, 0, 0);
    rotateZ(radians(-45));
    rect(0, 0, -87.5, 20);
    popMatrix();

    pushMatrix();
    translate(-350, 60, 0);
    rotateZ(radians((-back_left_link)/2));  
    rotateZ(radians((-front_left_link)/2));
    rotateZ(radians(194));
    fill(0, 255, 255);
    ellipse(0, 0, 20, 20);
    translate(-3, -10, 0);
    rect(0, 0, -175, 20);
    translate(-175, 10, 0);
    ellipse(0, 0, 20, 20);
    translate(87.5, 10, 0);
    rotateZ(radians(90));
    rect(0, 0, -107.5, 20);
    translate(-87.5, 7, 0);
    rotateZ(radians(45));
    rect(0, 0, -87.5, 20);
    popMatrix();

    //right body
    pushMatrix();
    rotateZ(radians((-back_right_link/2)));  
    rotateZ(radians(-front_right_link/2));
    rotateZ(radians(194));
    fill(0, 0, 255);
    ellipse(0, 0, 20, 20);
    translate(-3, -10, 0);
    rect(0, 0, 175, 20);
    translate(175, 10, 0);
    ellipse(0, 0, 20, 20); 
    translate(-87.5, 0, 0);
    rotateZ(radians(-90));
    rect(0, 0, -87.5, 20);
    translate(-75, 7, 0);
    rotateZ(radians(45));
    rect(0, 0, -87.5, 20);
    popMatrix(); 

    pushMatrix();   
    translate(0, 60, 0);
    rotateZ(radians((front_left_link/2)));  
    rotateZ(radians(back_left_link/2));
    rotateZ(radians(166));
    fill(0, 0, 255);
    ellipse(0, 0, 20, 20);
    translate(-3, -10, 0);
    rect(0, 0, 175, 20);
    translate(175, 10, 0);
    ellipse(0, 0, 20, 20);   
    translate(-87.5, 10, 0);
    rotateZ(radians(90));
    rect(0, 0, -107.5, 20);
    translate(-100, 0, 0);
    rotateZ(radians(-45));
    rect(0, 0, -87.5, 20);
    popMatrix();
  }

  // Comprova i actualitza els Sliders
  void checkSliders() {
    if (sX.mouseOnSlider()) {
      sX.updateSlider();
      X_Rotation = sX.v;
    }

    if (sY.mouseOnSlider()) {
      sY.updateSlider();
      Y_Rotation = sY.v;
    }

    if (sZ.mouseOnSlider()) {
      sZ.updateSlider();
      Z_Rotation = sZ.v;
    }

    if (sFR.mouseOnSlider()) {
      sFR.updateSlider();
      front_right_link = (int)sFR.v;
    }

    if (sFL.mouseOnSlider()) {
      sFL.updateSlider();
      front_left_link = (int)sFL.v;
    }

    if (sBR.mouseOnSlider()) {
      sBR.updateSlider();
      back_right_link = (int)sBR.v;
    }

    if (sBL.mouseOnSlider()) {
      sBL.updateSlider();
      back_left_link = (int)sBL.v;
    }
  }
}
