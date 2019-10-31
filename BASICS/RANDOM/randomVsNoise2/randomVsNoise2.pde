float x = 0; 
float yr = height/3;
float yn = 2*height/3;
float xoff = 0;
  
void setup(){
  size(1600,800);
  background(255,50,100);
  areaRandom();
  areaNoise();
}


void draw(){
   
  
  // RANDOM Y
  
    float yr = height/4 + random(-1, 1)*height/6;
    fill(0); 
    ellipse(x, yr, 5, 5);
  
  // NOISE Y
    float yn = 3*height/6 + noise(xoff)*height/3;
    fill(0);
    ellipse(x,  yn, 5, 5);
    xoff = xoff + 0.01;
  
  // NEXT X
    x+=1;
    if(x>=width){
      x = 0; yr = height/3;  yn = 2*height/3;
      background(255,50,100);
      areaRandom();
      areaNoise();
    }
  
}

void areaRandom(){
  textSize(18); fill(0);
  text("RANDOM", 10, 40);
  fill(220,50); noStroke();
  rect(0, height/12, width, height/3);
}

void areaNoise(){
  fill(0);
  text("NOISE", 10, height-100);
  fill(220,50); noStroke();
  rect(0, 6*height/12, width, height/3);
}
