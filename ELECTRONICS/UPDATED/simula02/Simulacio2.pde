import cc.arduino.*;

class Simulacio02 extends Simulacio {

  // Controlador Arduino
  Arduino arduino;

  // ServoMotor
  int Servo_Motor_1 = 0;
  
  // Llargades
  float l1=60, l2=80, l3 = 100;

  // Slider
  Slider sM; 

  Simulacio02(PApplet p) {
    super(p);    // Constructor pare
    initPins(p); // Inicialitza els pins
    initGui();   // Inicialitza elements de la GUI
  }

  // Inicialitza els pins Arduino
  void initPins(PApplet p) {
    //arduino = new Arduino(p, "/dev/ttyACM0", 57600);
    for (int i = 0; i <= 13; i++) {
      //arduino.pinMode(i, Arduino.OUTPUT);
    }
  }

  // Inicialitza la GUI de la simulació
  void initGui() {
    sM = new Slider("Servo_Motor_1", 100, 600, 500, 50, 0, 90, 90);
  }

  // Actualitza el servomotor
  void updateServo() {
    //arduino.analogWrite(9, Servo_Motor_1);  
    Servo_Motor_1 = (int)sM.v;
    delay(0);
  }

  void display() {
    
    // Informació
    fill(0); textSize(38); textAlign(LEFT);
    text("Braç Articulat", 150, 100);

    // Dibuixa articulacions (encadenadament)
    pushMatrix();    
    translate(150, 150); 
    drawLinkOne();  
    drawLinkThree();
    popMatrix();

    sM.display();  // Dibuixa slider
  }

  void drawLinkOne() {        
    //firstlink
    noStroke();
    fill(0, 255, 180);//pale green
    pushMatrix();
    translate(0, 0);
    rotate(radians(90));
    rotate(radians(-Servo_Motor_1));
    rect(-10, 0, 20, l1);
    ellipse(0, 0, 20, 20);
    ellipse(0, l1, 20, 20);
    drawLinkTwo();
    popMatrix();
  }

  void drawLinkTwo() {   
    //secondlink  
    pushMatrix();
    noStroke();
    fill(255, 0, 0);//red
    translate(0, 65);  
    rotate(radians(-180));
    rotate(radians(Servo_Motor_1));
    rect(-10, 0, 20, l2);
    ellipse(0, 0, 20, 20);
    ellipse(0, l2, 20, 20);
    popMatrix();
  }

  void drawLinkThree() {   
    //thirdlink  
    pushMatrix();
    noStroke();
    fill(0, 0, 255);//blue
    translate(70, 0);  
    rotate(radians(90));
    rotate(radians(-Servo_Motor_1));
    rect(-10, 0, 20, l1);
    ellipse(0, 0, 20, 20);
    ellipse(0, l1, 20, 20);  
    drawstepone();
    popMatrix(); 


    //fourthlink  
    pushMatrix();
    noStroke();
    fill(255, 255, 0);//yellow
    translate(120, 0);  
    rotate(radians(90));
    rotate(radians(-Servo_Motor_1));
    rect(-10, 0, 20, l3);
    ellipse(0, 0, 20, 20);
    ellipse(0, l3, 20, 20);  
    drawstepthree();
    popMatrix();
  }

  void drawstepone() {   
    //fifthlink

    fill(0, 168, 255);//skyblue
    pushMatrix(); 
    translate(0, 65);  
    rotate(radians(180));
    rotate(radians(Servo_Motor_1));
    rect(-10, 0, 20, l3);
    ellipse(0, 0, 20, 20);
    ellipse(0, l3, 20, 20);  
    drawsteptwo();
    popMatrix();
  }

  void drawsteptwo() {   
    //fifthlink  
    fill(2, 82, 124);//grey blue
    pushMatrix();
    translate(0, l3);  
    rotate(radians(180));
    rotate(radians(-Servo_Motor_1));
    rect(-10, 0, 20, l2);
    ellipse(0, 0, 20, 20);
    ellipse(0, l2, 20, 20);  
    drawstepfourone();
    popMatrix();
  }

  void drawstepthree() {
    fill(255, 94, 0);//florezent orange       
    pushMatrix();
    translate(0, l3);  
    rotate(radians(180));
    rotate(radians(Servo_Motor_1));
    rect(-10, 0, 20, l3);
    ellipse(0, 0, 20, 20);
    ellipse(0, l3, 20, 20);  
    drawstepthreetwo();
    popMatrix();
  }

  void drawstepthreetwo() {
    fill(35, 116, 40);//dark grey green
    pushMatrix();
    translate(0, l3);  
    rotate(radians(180));
    rotate(radians(-Servo_Motor_1));
    rect(-10, 0, 20, l3);
    ellipse(0, 0, 20, 20);
    ellipse(0, l3, 20, 20);  
    drawstepfiveone();
    popMatrix();
  }

  void drawstepfourone() {
    fill(3, 255, 17);//florezent green
    pushMatrix();
    translate(0, l2);  
    rotate(radians(-180));
    rotate(radians(Servo_Motor_1));
    rect(-10, 0, 20, l3);
    ellipse(0, 0, 20, 20);
    ellipse(0, l3, 20, 20);  
    drawstepfivetwo();
    popMatrix();
  }

  void drawstepfiveone() {
    fill(84, 0, 103);//dark magenta
    pushMatrix();
    translate(0, l3);  
    rotate(radians(-180));
    rotate(radians(Servo_Motor_1));
    rect(-10, 0, 20, l3);
    ellipse(0, 0, 20, 20);
    ellipse(0, l3, 20, 20);  
    drawstepsixone();
    popMatrix();
  }

  void drawstepfivetwo() {
    fill(207, 0, 255);//magenta
    pushMatrix();
    translate(0, l3);  
    rotate(radians(180));
    rotate(radians(-Servo_Motor_1));
    rect(-10, 0, 20, l3);
    ellipse(0, 0, 20, 20);
    ellipse(0, l3, 20, 20);  
    drawstepsixtwo();
    popMatrix();
  }

  void drawstepsixone() {
    fill(18, 85, 33);//green
    pushMatrix();
    translate(0, l3);  
    rotate(radians(180));
    rotate(radians(-Servo_Motor_1));
    rect(-10, 0, 20, l3);
    ellipse(0, 0, 20, 20);
    ellipse(0, l3, 20, 20);  
    drawstep7one();
    popMatrix();
  }

  void drawstepsixtwo() {
    fill(15, 191, 54);//lighterthanabove
    pushMatrix();
    translate(0, l3);  
    rotate(radians(-180));
    rotate(radians(Servo_Motor_1));
    rect(-10, 0, 20, l3);
    ellipse(0, 0, 20, 20);
    ellipse(0, l3, 20, 20);  
    drawstep7two();
    popMatrix();
  }


  void drawstep7one() {
    fill(100, 0, 183);//pinkishblue
    pushMatrix();
    translate(0, l3);  
    rotate(radians(-180));
    rotate(radians(Servo_Motor_1));
    rect(-10, 0, 20, l3);
    ellipse(0, 0, 20, 20);
    ellipse(0, l3, 20, 20);  
    popMatrix();
  }

  void drawstep7two() {
    fill(151, 97, 196);//lighterthanabove
    pushMatrix();
    translate(0, l3);  
    rotate(radians(180));
    rotate(radians(-Servo_Motor_1));
    rect(-10, 0, 20, l3/2);
    ellipse(0, 0, 20, 20);
    ellipse(0, l3/2, 20, 20);  
    popMatrix();
  }

  // Comprova i actualitza els Sliders
  void checkSlider() {
    if (sM.mouseOnSlider()) {
      sM.updateSlider();
    }
  }
}
