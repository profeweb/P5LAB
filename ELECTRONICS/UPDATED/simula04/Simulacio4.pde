import cc.arduino.*;

class Simulacio04 extends Simulacio {

  // Controlador arduino
  Arduino arduino;

  // Models 3D de les parts
  PShape L1, L2, L3, L4, base; 

  float right_link = 90;
  float left_link= 0;

  // Valors de la rotació
  float X_Rotation = 0.0;
  float Y_Rotation = 0.0;
  float Z_Rotation = 0.0;

  //Sliders de la gui
  Slider sX, sY, sZ;
  Slider sR, sL;

  // Constructor
  Simulacio04(PApplet p) {
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
    
    sR = new Slider("Right_Link", 550, 50, 300, 50, 0, 90, 0);
    sR.setColor(color(100, 100, 255));
    sL = new Slider("Left_link", 550, 150, 300, 50, 0, 90, 0);
    sL.setColor(color(100, 100, 255));
  }


  // Dibuixa la gui
  void display() {
    pushMatrix();    
    translate(width/2, 550); 
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
    sR.display();
    sL.display();
  }

  // Actualitza els valors a l'Arduino
  void updateSerial() {
    arduino.analogWrite(8, (int)right_link);  
    arduino.analogWrite(9, (int)left_link);
    delay(0);
  }


  void displayRobotArm() { 
    pushMatrix(); 
    translate(0, 110, 0);
    rotateX(radians(90));
    scale(0.75);
    shape(base);  
    popMatrix();    

    pushMatrix();             
    rotateX(radians(-90));
    rotateY(radians(right_link));      
    translate(0, 0, 0);   
    scale(0.75);
    shape(L1);  
    translate(300, 0, 0);
    rotateY(radians(-90));
    rotateY(radians(left_link)+radians(0));  
    rotateY(radians(-right_link)+radians(90));       
    shape(L3);     
    popMatrix();          

    pushMatrix();             
    translate(0, 0, 0);   
    rotateX(radians(270));
    rotateY(radians(left_link));      
    scale(0.75);
    shape(L2);   
    translate(300, 0, 0);
    rotateY(radians(90));
    rotateY(radians(-left_link));  
    rotateY(radians(right_link)+radians(-90));
    shape(L4);     
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
    
    if (sR.mouseOnSlider()) {
      sR.updateSlider();
      right_link = sR.v;
    }
    
    if (sL.mouseOnSlider()) {
      sL.updateSlider();
      left_link = sL.v;
    }
  }
}
