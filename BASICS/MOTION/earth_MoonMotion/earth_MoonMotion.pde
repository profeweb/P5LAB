
float xEarth, yEarth;
float xMoon, yMoon;


// Motion params for Earth
float cx, cy;
float angleE = 0.0;
float radiusHE = 200;
float radiusVE = 100;
float stepAE = 0.025;


// Motion params for Moon
float angleM = 0.0;
float radiusM = 100;
float stepAM = 0.1;

void setup(){
  size(800,800); 
  
  // Sets the center of Earth elliptical motion
  cx = width/2;
  cy = height/2;
}


void draw(){
  
  background(255);
  
  // Calculates new position of Earth (elliptical motion)
  xEarth = cx + cos(angleE)*radiusHE;
  yEarth = cy + sin(angleE)*radiusVE;
  
  // Calculates new position of Moon (circular motion)
  xMoon = xEarth + cos(angleM)*radiusM;
  yMoon = yEarth + sin(angleM)*radiusM;
  
  // Displays Earth's orbit
  fill(255); strokeWeight(1);
  ellipse(cx, cy, 2*radiusHE, 2*radiusVE);
  
  
  // Displays Earth planet
  fill(0,0,255); strokeWeight(4);
  ellipse(xEarth, yEarth, 80, 80);
  
  // Displays Moon
  fill(50); strokeWeight(4);
  ellipse(xMoon, yMoon, 40, 40);
  
  
  // Updates angles for Earth and Moon motions
  angleE += stepAE;
  angleM += stepAM;
  
}
