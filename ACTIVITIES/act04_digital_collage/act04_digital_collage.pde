
PImage img, img1, img2, img3;
String txt, txt1, txt2, txt3;
PFont font, font1, font2, font3;

int numImage=1, numText=1, numFont=1;
boolean randomStuff=false;

void setup() {
 size(1920, 1080);
 background(255);
 
 imageMode(CENTER);
// Load images
 img1 = loadImage("leaf01.png");
 img2 = loadImage("leaf02.png");
 img3 = loadImage("leaf03.png");
// Set text variables
 txt1 = "Hello";
 txt2 = "Bye";
 txt3 = "Autumn";
 
 //Set fonts
 font1 = loadFont("Haziness.ttf");
 font2 = loadFont("Chalk.ttf");
 font3 = loadFont("Bombing.ttf");
 
 font = font1;
 img = img1;
 txt = txt1;
}

void keyPressed(){
  setParameters();
}

void mousePressed(){
  addStuff();
}

void setParameters(){
    if(key=='r' || key=='R'){
       randomStuff = true;
    }
    else if(key=='f' || key=='F'){
       randomStuff = false;
    }
    else if(key=='x' || key=='X'){
       background(255);
    }
}
void addStuff(){
    if(mouseButton==LEFT){
       addImage();
    }
    else {
       addText();
    }
}

void addImage(){
 int n;
 float x, y, s=18, a;
 if(randomStuff){
    n = floor(random(3));
    x = random(width);
    y = random(height);
    s = random(0.2, 0.5);
    a = random(0, TWO_PI);
 }
 else {
    n = numImage;
    x = mouseX;
    y = mouseY;
    s = 0.5;
    a = random(0, TWO_PI);
 }
 // Set the image to display
 switch(n){
    case 0: img = img1; break;
    case 1: img = img2; break;
    case 2: img = img3; break;
 }
 translate(x,y);
 rotate(a);
 scale(s, s);
 image(img, x, y);
}

void addText(){
 int n=0, f=0;
 float x, y, s=18;
 if(randomStuff){
    n = floor(random(3));
    f = floor(random(3));
    x = random(width);
    y = random(height);
    s = random(18, 52);
 }
 else {
    n = numText;
    x = mouseX;
    y = mouseY;
 }
 // Set text to display
 switch(n){
    case 0: txt = txt1; break;
    case 1: txt = txt2; break;
    case 2: txt = txt3; break;
 }
 // Set font to use
 switch(f){
    case 0: font = font1; break;
    case 1: font = font2; break;
    case 2: font = font3; break;
 }
 translate(x,y);
 fill(random(255), random(255), random(255));
 textFont(font);
 textSize(s);
 text(txt, 0, 0);
}

void draw() {
 setParameters();
 addStuff();
}
