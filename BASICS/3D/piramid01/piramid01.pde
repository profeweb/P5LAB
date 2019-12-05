
void setup() {
   size(800, 800, P3D);
}

void draw() {
    background(25);
   
    translate(width/2, height/2, 0);
    stroke(255);
    rotateX(PI/2);
    rotateZ(-PI/6);
    noFill();
    
    beginShape();
    vertex(-100, -100, -100);
    vertex( 100, -100, -100);
    vertex(   0,    0,  100);
    
    vertex( 100, -100, -100);
    vertex( 100,  100, -100);
    vertex(   0,    0,  100);
    
    vertex( 100, 100, -100);
    vertex(-100, 100, -100);
    vertex(   0,   0,  100);
    
    vertex(-100,  100, -100);
    vertex(-100, -100, -100);
    vertex(   0,    0,  100);
    endShape();
}
