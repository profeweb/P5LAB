class Xemeneia {
  
  
  float ampleBase, altBase;
  float ampleMid;
  float ampleTop, altTop;
  
  Xemeneia(float ampB, float altB, float ampM, float ampT, float altT){
    this.ampleBase = ampB;
    this.altBase = altB;
    this.ampleMid = ampM;
    this.ampleTop = ampT;
    this.altTop = altT;
  }
  
  
  void display(float x, float y, float z){
    
    noFill(); strokeWeight(3);
    
    pushMatrix();
      translate(x, y, z);
      
      // FRONT BOTTOM
      beginShape();
        vertex(x-ampleBase/2, y, z-ampleBase/2);
        vertex(x+ampleBase/2, y, z-ampleBase/2);
        vertex(x+ampleMid/2, y - altBase, z-ampleMid/2);
        vertex(x-ampleMid/2, y - altBase, z-ampleMid/2);
      endShape(CLOSE);
      
      // BACK BOTTOM
      beginShape();
      vertex(x-ampleBase/2, y, z+ampleBase/2);
      vertex(x+ampleBase/2, y, z+ampleBase/2);
      vertex(x+ampleMid/2, y - altBase, z+ampleMid/2);
      vertex(x-ampleMid/2, y - altBase, z+ampleMid/2);
      endShape(CLOSE);
      
      //LEFT  BOTTOM
      beginShape();
      vertex(x+ampleBase/2, y, z-ampleBase/2);
      vertex(x+ampleBase/2, y, z+ampleBase/2);
      vertex(x+ampleMid/2, y - altBase, z+ampleMid/2);
      vertex(x+ampleMid/2, y - altBase, z-ampleMid/2);
      endShape(CLOSE);
      
      // RIGHT BOTTOM
      beginShape();
      vertex(x-ampleBase/2, y, z-ampleBase/2);
      vertex(x-ampleBase/2, y, z+ampleBase/2);
      vertex(x-ampleMid/2, y - altBase, z+ampleMid/2);
      vertex(x-ampleMid/2, y - altBase, z-ampleMid/2);
      endShape(CLOSE);
      
      
      // FRONT TOP
      beginShape();
        vertex(x-ampleMid/2, y - altBase, z-ampleMid/2);
        vertex(x+ampleMid/2, y - altBase, z-ampleMid/2);
        vertex(x+ampleTop/2, y - altBase - altTop, z-ampleTop/2);
        vertex(x-ampleTop/2, y - altBase - altTop, z-ampleTop/2);
      endShape(CLOSE);
      
      // BACK TOP
      beginShape();
        vertex(x-ampleMid/2, y - altBase, z+ampleMid/2);
        vertex(x+ampleMid/2, y - altBase, z+ampleMid/2);
        vertex(x+ampleTop/2, y - altBase - altTop, z+ampleTop/2);
        vertex(x-ampleTop/2, y - altBase - altTop, z+ampleTop/2);
      endShape(CLOSE);
      
      // LEFT TOP
      beginShape();
        vertex(x+ampleMid/2, y - altBase, z+ampleMid/2);
        vertex(x+ampleMid/2, y - altBase, z-ampleMid/2);
        vertex(x+ampleTop/2, y - altBase - altTop, z-ampleTop/2);
        vertex(x+ampleTop/2, y - altBase - altTop, z+ampleTop/2);
      endShape(CLOSE);
      
      // RIGHT TOP
      beginShape();
        vertex(x-ampleMid/2, y - altBase, z+ampleMid/2);
        vertex(x-ampleMid/2, y - altBase, z-ampleMid/2);
        vertex(x-ampleTop/2, y - altBase - altTop, z-ampleTop/2);
        vertex(x-ampleTop/2, y - altBase - altTop, z+ampleTop/2);
      endShape(CLOSE);
      
    popMatrix();
  }
  
  
}
