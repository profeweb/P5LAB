

int numImages = 8;
int currentFrame = 0;
PImage[] img;

void setup(){
  
  size(800,800);
  frameRate(15);
  
  img = new PImage[numImages];
  
  for(int i=0; i<numImages; i++){
    String imageName = "frame"+i+".png";
    img[i] = loadImage(imageName);
  }
}


void draw(){
  background(255);
  imageMode(CENTER);
  image(img[currentFrame], width/2, height/2);
  
  currentFrame++;
  if(currentFrame>=img.length){
    currentFrame=0;
  }
}
