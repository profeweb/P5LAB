

// Number of snow flocks
int numFlocks = 50;

// Number of different images
int numImages = 9;

// Arrays to store snow flock data
PImage[] img;     // Images
color[] c;        // Color
float[] x, y, s;  // X & Y coordinates, and Scale factor


void setup(){
  size(1600,800);
  
  // Creates img array
  img = new PImage[numFlocks];
  
  //Creates  color array
  c = new color[numFlocks];
  
  //Creates position x array
  x = new float[numFlocks];
  
  //Creates position y array
  y = new float[numFlocks];
  
  // Creates size array
  s = new float[numFlocks];
  
  
  // Fill in all the arrays
  for(int i=0; i<numFlocks; i++){
    c[i] = color(random(100, 255), 0, random(0, 100), random(100, 200));
    x[i] = random(0, width);
    y[i] = random(-1500, 0);
    s[i] = random(0.25, 1.0);
    int r = (int)random(numImages);
    String imgName = "snow-0"+r+".png";
    img[i] = loadImage(imgName);
  }
    
}


void draw(){
  
  background(255);
  
  for(int i=0; i<numFlocks; i++){
    
    // Display snow flock
    pushMatrix();
      translate(x[i],y[i]);
      scale(s[i]);
      tint(c[i]);
      imageMode(CENTER);
      image(img[i],0,0);
    popMatrix();
    
    // Update snow flock position
    y[i] += 5;
    x[i] += random(-1,1);
    
    // Reset position when exits from screen
    if(y[i] - (img[i].height/2)*s[i] > height){
      x[i] = random(width);
      y[i] = random(-1500,0);
    }
  }
}
