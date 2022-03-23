import cc.arduino.*;

class Simulacio03 extends Simulacio {

  // Controlador arduino
  Arduino arduino;

  // Models 3D de les parts del braç robòtic
  PShape base, body, shouldercylinder, arm;

  float Base = 0;
  float Shoulder= 0;
  float Arm= 0;

  // Valors de la rotació
  float X_Rotation = 0.0;
  float Y_Rotation = 0.0;
  float Z_Rotation = 0.0;

  //Sliders de la gui
  Slider sX, sY, sZ;
  Slider sB, sS, sA;

  // Constructor
  Simulacio03(PApplet p) {
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
    body = loadShape("body.obj");
    base = loadShape("base.obj");
    shouldercylinder = loadShape("shouldercylinder.obj");
    arm = loadShape("arm.obj");

    // Sliders
    sX = new Slider("X_Rotation", 50, 50, 300, 50, 0, 6.28, 0);
    sY = new Slider("Y_Rotation", 50, 150, 300, 50, 0, 6.28, 0);
    sZ = new Slider("Z_Rotation", 50, 250, 300, 50, 0, 6.28, 0);
    
    sB = new Slider("Base", 550, 50, 300, 50, 0, 90, 0);
    sB.setColor(color(100, 100, 255));
    sS = new Slider("Shoulder", 550, 150, 300, 50, 0, 90, 0);
    sS.setColor(color(100, 100, 255));
    sA = new Slider("Arm", 550, 250, 300, 50, 0, 90, 0);
    sA.setColor(color(100, 100, 255));
  }


  // Dibuixa la gui
  void display() {
    
    // Dibuixa els sliders
    sX.display();
    sY.display();
    sZ.display();
    
    sB.display();
    sS.display();
    sA.display();
    
    pushMatrix();    
    translate(width/2, 550); 
    scale(2);
    rotateY(X_Rotation);  
    rotateX(Y_Rotation);
    rotateZ(Z_Rotation);
    displayRobotArm(); 
    popMatrix();
    
    
  }

  // Actualitza els valors a l'Arduino
  void updateSerial() {
    arduino.analogWrite(8, (int)Base);  
    arduino.analogWrite(9, (int)Shoulder);  
    arduino.analogWrite(10, (int)Arm);  
    delay(0);
  }


  void displayRobotArm(){ 
    pushMatrix(); 
    translate(0, 0, 0);  
    scale(0.12);
    shape(base);       
    popMatrix();   

    pushMatrix();   

    rotateY(radians(Base)); 
    translate(0, 0, 0);   
    scale(0.12);
    shape(body);    

    translate(0, -500, 0);
    rotateZ(radians(-Shoulder)+radians(-90));      
    shape(shouldercylinder);     

    translate(0, 825, 200);
    rotateZ(radians(-Arm));      
    shape(arm);   

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
    
    if (sB.mouseOnSlider()) {
      sB.updateSlider();
      Base = sB.v;
    }
    
    if (sS.mouseOnSlider()) {
      sS.updateSlider();
      Shoulder = sS.v;
    }
    
    if (sA.mouseOnSlider()) {
      sA.updateSlider();
      Arm = sA.v;
    }
  }
}
