float s = 100;

void setup() {
   size(800, 800, P3D);
}

void draw() {
    background(25);
   
    translate(width/2, height/2, 0);
    stroke(255); strokeWeight(3);
    rotateX(frameCount/10);
    rotateZ(frameCount/20);
    
    fill(255, 0, 0);
    beginShape();
    vertex(-s, -s, -s);
    vertex( s, -s, -s);
    vertex( 0,  0,  s);
    endShape(CLOSE);
    
    fill(0,255, 0);
    beginShape();
    vertex( s, -s, -s);
    vertex( s,  s, -s);
    vertex( 0,  0,  s);
    endShape(CLOSE);
    
    fill(0, 0, 255);
    beginShape();
    vertex( s, s, -s);
    vertex(-s, s, -s);
    vertex(   0,   0,  s);
    endShape(CLOSE);
    
    fill(255, 255, 0);
    beginShape();
    vertex(-s,  s, -s);
    vertex(-s, -s, -s);
    vertex(   0,    0,  s);
    endShape(CLOSE);
    
}
