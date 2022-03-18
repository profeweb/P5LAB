import controlP5.*; //import ControlP5 library
import processing.serial.*;
import processing.video.*;
Serial port;

ControlP5 cp5; //create ControlP5 object
sliderV sV1, sV2, sV3;

PFont zigBlack;
Capture cam;
PImage img;
PImage logo;
PImage rgb;

void setup(){ 

size(1200, 700);    //window size, (width, height)
background(255);
PFont font = createFont("Georgia",12); 
//camera starts
                                    String[] cameras = Capture.list();
                                    
                                    if (cameras.length == 0) {
                                      println("There are no cameras available for capture.");
                                      exit();
                                    } else {
                                      println("Available cameras:");
                                      for (int i = 0; i < cameras.length; i++) {
                                        println(cameras[i]);
                                      }
                                      
                                      // The camera can be initialized directly using an 
                                      // element from the array returned by list():
                                      cam = new Capture(this, cameras[0]);
                                      cam.start();     
                                    }   
 //camera over
  
  
  printArray(Serial.list());   //prints all available serial ports
  
  port = new Serial(this, "/dev/ttyACM0", 9600);  //i have connected arduino to /dev/ttyACM0, it would be different in windows and mac os

  cp5 = new ControlP5(this);
         zigBlack = createFont("Serif.bolditalic-48.vlw", 20); 
         font = createFont("CenturySchL-BoldItal-48", 18);    // custom fonts for buttons and title
  
  cp5.addButton("Red_ON")   
    .setPosition(20, 75)  
    .setSize(120, 70)     
    .setFont(font)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(255,0,0))
               .setColorForeground(color(200,200,200)) 
               .setColorBackground(color(255,0,0))
    
  ;   
  cp5.addButton("Red_OFF")     
    .setPosition(170, 75) 
    .setSize(120, 70)     
    .setFont(font)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(255,0,0))
               .setColorForeground(color(200,200,200)) 
               .setColorBackground(color(255,0,0))    
    
  ;
  
  cp5.addButton("Blue_ON")   
    .setPosition(20, 175) 
    .setSize(120, 70)      
    .setFont(font)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(0,0,255))
               .setColorForeground(color(200,200,200)) 
               .setColorBackground(color(0,0,255))    
  ;

  cp5.addButton("Blue_OFF")     
    .setPosition(170, 175) 
    .setSize(120, 70)      
    .setFont(font)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(0,0,255))
               .setColorForeground(color(200,200,200)) 
               .setColorBackground(color(0,0,255))
  ;
  
  cp5.addButton("Green_ON")     
    .setPosition(20, 275)  
    .setSize(120, 70)     
    .setFont(font)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(0,255,0))
               .setColorForeground(color(200,200,200)) 
               .setColorBackground(color(0,255,0))
  ;
  
    cp5.addButton("Green_OFF")    
    .setPosition(170, 275)  
    .setSize(120, 70)     
    .setFont(font)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(0,255,0))
               .setColorForeground(color(200,200,200)) 
               .setColorBackground(color(0,255,0))    
  ;
  
    cp5.addButton("Yellow_ON")   
    .setPosition(20, 375) 
    .setSize(120, 70)      
    .setFont(font)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(255,255,0))
               .setColorForeground(color(200,200,200)) 
               .setColorBackground(color(255,255,0))    
  ;
  
  cp5.addButton("Yellow_OFF")    
    .setPosition(170, 375) 
    .setSize(120, 70)     
    .setFont(font)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(255,255,0))
               .setColorForeground(color(200,200,200)) 
               .setColorBackground(color(255,255,0))     
  ;
  
   cp5.addButton("Pink_ON")     
    .setPosition(20, 475) 
    .setSize(120, 70)     
    .setFont(font)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(255,0,255))
               .setColorForeground(color(200,200,200)) 
               .setColorBackground(color(255,0,255))      
  ; 
  
     cp5.addButton("Pink_OFF")    
    .setPosition(170, 475)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(255,0,255))
               .setColorForeground(color(200,200,200)) 
               .setColorBackground(color(255,0,255))      
  ; 
  
   cp5.addButton("All_ON")     
    .setPosition(20, 575)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
               .setColorValue(color(0))
               .setColorLabel(255)
               .setColorActive(color(0,0,0))
               .setColorForeground(color(200,200,200)) 
               .setColorBackground(color(0,0,0))     
  ; 
  
     cp5.addButton("All_OFF")    
    .setPosition(170, 575)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
               .setColorValue(color(0))
               .setColorLabel(255)
               .setColorActive(color(0,0,0))
               .setColorForeground(color(200,200,200)) 
               .setColorBackground(color(0,0,0))     
  ;   
   
 //RGB Slider Creation starts  
   
  sV1 = new sliderV(575, 400, 90, 255, #FF0000);
  sV2 = new sliderV(675, 400, 90, 255, #03FF00);
  sV3 = new sliderV(775, 400, 90, 255, #009BFF);

  img = loadImage("robot.png"); 
  logo = loadImage("logo.jpg");
  rgb = loadImage("rgbledcolour.png");
}

void draw(){ 
    
  sV1.render();
  sV2.render();
  sV3.render();
  
  fill(sV1.p,sV2.p,sV3.p);
  rect(925, 425, 200, 200);  

// send sync character
// send the desired value
  port.write('j');
  port.write(sV1.p);
  port.write('k');
  port.write(sV2.p);
  port.write('l');
  port.write(sV3.p);
  
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 425, 75,320,240);
  image(img, 0, 5, 1200, 50);
  //image(logo, 900, 425, 250, 200);
  image(logo, 315, 425, 250, 200);
  image(rgb, 925, 630, 200, 20);

}


void Red_ON(){
  port.write('r');
}

void Red_OFF(){
  port.write('a');
}

void Blue_ON(){
  port.write('b');
}

void Blue_OFF(){
  port.write('c');
}

void Green_ON(){
  port.write('g');
}

void Green_OFF(){
  port.write('d');
}

void Yellow_ON(){
  port.write('y');
}

void Yellow_OFF(){
  port.write('e');
}

void Pink_ON(){
  port.write('p');
}

void Pink_OFF(){
  port.write('f');
}

void All_ON(){
  port.write('z');
}

void All_OFF(){
  port.write('x');
}


class sliderV {
int x, y, w, h, p;
  color cor;
boolean slide;

  sliderV (int _x, int _y, int _w, int _h, color _cor) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    p = 90;
    cor = _cor;
    slide = true;
  }

void render() {
    fill(cor);
    rect(x-1, y-4, w, h+10);
    noStroke();
    fill(0);
    rect(x, h-p+y-5, w-2, 13);
    fill(255);
    text(p, x+2, h-p+y+6);
    
    if (slide==true && mousePressed==true && mouseX<x+w && mouseX>x){
      if ((mouseY<=y+h+150) && (mouseY>=y-150)) {
        p = h-(mouseY-y);
if (p<0) {
          p=0;
        }
else if (p>h) {
          p=h;
        }
      }
    }
  }
}