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
        vertex(-ampleBase/2, 0, -ampleBase/2);
        vertex(+ampleBase/2, 0, -ampleBase/2);
        vertex(+ampleMid/2, - altBase, -ampleMid/2);
        vertex(-ampleMid/2, - altBase, -ampleMid/2);
      endShape(CLOSE);
      
      // BACK BOTTOM
      beginShape();
      vertex(-ampleBase/2, 0, ampleBase/2);
      vertex(+ampleBase/2, 0, ampleBase/2);
      vertex(+ampleMid/2, - altBase, ampleMid/2);
      vertex(-ampleMid/2, - altBase, ampleMid/2);
      endShape(CLOSE);
      
      //LEFT  BOTTOM
      beginShape();
      vertex(ampleBase/2, 0, -ampleBase/2);
      vertex(ampleBase/2, 0, +ampleBase/2);
      vertex(ampleMid/2, - altBase, +ampleMid/2);
      vertex(ampleMid/2, - altBase, -ampleMid/2);
      endShape(CLOSE);
      
      // RIGHT BOTTOM
      beginShape();
      vertex(-ampleBase/2, 0, -ampleBase/2);
      vertex(-ampleBase/2, 0, +ampleBase/2);
      vertex(-ampleMid/2, -altBase, +ampleMid/2);
      vertex(-ampleMid/2, -altBase, -ampleMid/2);
      endShape(CLOSE);
      
      
      // FRONT TOP
      beginShape();
        vertex(-ampleMid/2, - altBase, -ampleMid/2);
        vertex(+ampleMid/2, - altBase, -ampleMid/2);
        vertex(+ampleTop/2, - altBase - altTop, -ampleTop/2);
        vertex(-ampleTop/2, - altBase - altTop, -ampleTop/2);
      endShape(CLOSE);
      
      // BACK TOP
      beginShape();
        vertex(-ampleMid/2, - altBase, +ampleMid/2);
        vertex(+ampleMid/2, - altBase, +ampleMid/2);
        vertex(+ampleTop/2, - altBase - altTop, +ampleTop/2);
        vertex(-ampleTop/2, - altBase - altTop, +ampleTop/2);
      endShape(CLOSE);
      
      // LEFT TOP
      beginShape();
        vertex(+ampleMid/2, - altBase, +ampleMid/2);
        vertex(+ampleMid/2, - altBase, -ampleMid/2);
        vertex(+ampleTop/2, - altBase - altTop, -ampleTop/2);
        vertex(+ampleTop/2, - altBase - altTop, +ampleTop/2);
      endShape(CLOSE);
      
      // RIGHT TOP
      beginShape();
        vertex(-ampleMid/2,  - altBase, +ampleMid/2);
        vertex(-ampleMid/2,  - altBase, -ampleMid/2);
        vertex(-ampleTop/2,  - altBase - altTop, -ampleTop/2);
        vertex(-ampleTop/2,  - altBase - altTop, +ampleTop/2);
      endShape(CLOSE);
      
    popMatrix();
  }
  
  
}
