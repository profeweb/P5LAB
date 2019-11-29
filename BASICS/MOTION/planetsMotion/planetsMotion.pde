
// Number of Planets
int numPlanets = 4;

// Position X & Y of Planets
float[] x;
float[] y;


// Centers of Orbits
float[] cx = {400, 400, 400, 400};
float[] cy = {400, 400, 400, 400};

// Horizontal & Verical Radius of Orbits
float[] rH = {100, 150, 200, 300};
float[] rV = {50, 80, 100, 150};

// Angle
float[] angle = {0, 0, 0, 0};
float[] stepA = {0.02, 0.05, 0.075, 0.1};


void setup(){
  size(800,800); 
  
  // Creates the arrays to store position X & Y for every planet
  x = new float[numPlanets];
  y = new float[numPlanets];
}


void draw(){
  
  background(255);
  
  // For every planet :
  for(int i=0; i<numPlanets; i++){
    
    // Calculates new position of planet (elliptic motion)
    x[i] = cx[i] + cos(angle[i])*rH[i];
    y[i] = cy[i] + sin(angle[i])*rV[i];
    
    // Displays planet's orbit
    noFill(); strokeWeight(1);
    ellipse(cx[i], cy[i], 2*rH[i], 2*rV[i]);
    
    // Displays planet
    fill(lerpColor(color(255, 0, 0), color(0, 0, 255), (float)i/numPlanets)); strokeWeight(4);
    ellipse(x[i], y[i], 40, 40);
    
    // Updates angle
    angle[i] += stepA[i];
  }
  
}
