

class Animable {
  
  // Position Now and Next
  float xNow, yNow, xNext, yNext;
  
  // Size Now and Next
  float sNow, sNext ;
  
  // Rotation Now and Next
  float rNow, rNext;
  
  // Frame to Start Animations
  float startPos, startSize, startRot = 0;
  
  // Step for Animations
  float stepPos, stepSize, stepRot;
  
  // Shape to display
  PShape shape;
  
  
  // Constructor
  Animable(float x, float y, float s, float r, String fileName){
    xNow = x;   xNext = x;
    yNow = y;   yNext = y;
    sNow = s;   sNext = s;
    rNow = r;   rNext = r;
    shape = loadShape(fileName);
  }
  
  
  // Set a Position Animation
  void setPosAnimation(float start, float xn, float yn, float step){
      this.startPos = start;
      this.xNext    = xn;
      this.yNext    = yn;
      this.stepPos  = step;
  }
  
  // Set a Size Animation
  void setSizeAnimation(float start, float sn, float step){
      this.startSize = start;
      this.sNext     = sn;
      this.stepSize  = step;
  }
  
  // Set a Rotation Animation
  void setRotAnimation(float start, float rn, float step){
      this.startRot = start;
      this.rNext    = rn;
      this.stepRot  = step;
  }
  
  
  // Animate
  void animate(){
    
    // Animate Position
    if(frameCount>=startPos && (xNow!=xNext || yNow!=yNext)){
      xNow = xNow + (xNext - xNow)*stepPos;
      yNow = yNow + (yNext - yNow)*stepPos;
    }
    
    // Animate Size
    if(frameCount>=startSize && sNow!=sNext){     
      sNow = sNow + (sNext - sNow)*stepSize;
    }
    
    // Animate Rotation
    if(frameCount>=startRot && rNow!=rNext){     
      rNow = rNow + (rNext - rNow)*stepRot;
    }
  }
  
  // Display Animable Item
  void display(){
    pushMatrix();
      translate(xNow, yNow);
      scale(sNow);
      rotate(rNow);
      shapeMode(CENTER);
      shape(shape,0,0);
    popMatrix();
  }
  
  
}
