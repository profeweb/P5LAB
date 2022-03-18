import processing.serial.*;

class Simulacio1 {

  Serial port;
  
  Button bRedOn, bBlueOn, bGreenOn, bYellowOn, bPinkOn, bAllOn;
  Button bRedOff, bBlueOff, bGreenOff, bYellowOff, bPinkOff, bAllOff;
  SliderV sV1, sV2, sV3;

  Simulacio1() {
    connectSerial();
    initGui();
  }

  void connectSerial() {
    printArray(Serial.list()); 
    //port = new Serial(this, "/dev/ttyACM0", 9600);
  }

  void initGui() {

    // LED Buttons
    bRedOn = new Button("Red_ON", 20, 75, 120, 70);
    bRedOn.fillColor=color(255, 0, 0);
    
    bRedOff = new Button("Red_OFF", 170, 75, 120, 70);
    bRedOff.fillColor=color(255, 0, 0);
    
    bBlueOn = new Button("Blue_ON", 20, 175, 120, 70);
    bBlueOn.fillColor=color(0, 0, 255);
    
    bBlueOff = new Button("Blue_OFF", 170, 175, 120, 70);
    bBlueOff.fillColor=color(0, 0, 255);
    
    bGreenOn = new Button("Green_ON", 20, 275, 120, 70);
    bGreenOn.fillColor=color(0, 255, 0);
    
    bGreenOff = new Button("Green_OFF", 170, 275, 120, 70);
    bGreenOff.fillColor=color(0, 255, 0);
    
    bYellowOn = new Button("Yellow_ON", 20, 375, 120, 70);
    bYellowOn.fillColor=color(255, 255, 0);
    
    bYellowOff = new Button("Yellow_OFF", 170, 375, 120, 70);
    bYellowOff.fillColor=color(255, 255, 0);
    
    bPinkOn = new Button("Pink_ON", 20, 475, 120, 70);
    bPinkOn.fillColor=color(255, 0, 255);
    
    bPinkOff = new Button("Pink_OFF", 170, 475, 120, 70);
    bPinkOff.fillColor=color(255, 0, 255);
    
    bAllOn = new Button("All_ON", 20, 575, 120, 70);
    bAllOn.fillColor=color(255, 0, 255);
    
    bAllOff = new Button("All_OFF", 170, 575, 120, 70);
    bAllOff.fillColor=color(255, 0, 255);  

    //RGB Sliders
    sV1 = new SliderV(325, 385, 90, 255, #FF0000);
    sV2 = new SliderV(425, 385, 90, 255, #03FF00);
    sV3 = new SliderV(525, 385, 90, 255, #009BFF);
  }

  void updateSerial() {
    /*
     port.write('j');
     port.write(sV1.v);
     port.write('k');
     port.write(sV2.v);
     port.write('l');
     port.write(sV3.v);
     */
  }

  void display() {
    
    fill(0); textSize(44); textAlign(LEFT);
    text("LED RGB Controller", 20, 50);
    
    bRedOn.display(); bRedOff.display();
    bGreenOn.display(); bGreenOff.display();
    bBlueOn.display(); bBlueOff.display();
    bYellowOn.display(); bYellowOff.display();
    bPinkOn.display(); bPinkOff.display();
    bAllOn.display(); bAllOff.display();
    
    sV1.display();
    sV2.display();
    sV3.display();

    fill(sV1.v, sV2.v, sV3.v);
    rect(325, 75, 290, 290, 5);
  }
  
  void checkButtons(){
    if(bRedOn.mouseOverButton() && bRedOn.enabled){
      writeToSerial('r');
    }
    else if(bRedOff.mouseOverButton() && bRedOff.enabled){
      writeToSerial('a');
    }
    else if(bBlueOn.mouseOverButton() && bBlueOn.enabled){
      writeToSerial('b');
    }
    else if(bBlueOff.mouseOverButton() && bBlueOff.enabled){
      writeToSerial('c');
    }
    else if(bGreenOn.mouseOverButton() && bGreenOn.enabled){
      writeToSerial('g');
    }
    else if(bGreenOff.mouseOverButton() && bGreenOff.enabled){
      writeToSerial('d');
    }
    else if(bYellowOn.mouseOverButton() && bYellowOn.enabled){
      writeToSerial('y');
    }
    else if(bYellowOff.mouseOverButton() && bYellowOff.enabled){
      writeToSerial('e');
    }
    else if(bPinkOn.mouseOverButton() && bPinkOn.enabled){
      writeToSerial('p');
    }
    else if(bPinkOff.mouseOverButton() && bPinkOff.enabled){
      writeToSerial('f');
    }
    else if(bAllOn.mouseOverButton() && bAllOn.enabled){
      writeToSerial('z');
    }
    else if(bAllOff.mouseOverButton() && bAllOff.enabled){
      writeToSerial('x');
    }
  }
  
  void checkSliders(){
    sV1.checkMouseOn();
    sV2.checkMouseOn();
    sV3.checkMouseOn();
  }
  
  void writeToSerial(char c){
    //port.write(c);
    println(c);
  }
}
