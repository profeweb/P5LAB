float s = 200;

void setup() {
   size(800, 800, P3D);
}

void draw() {
    background(25);
   
    translate(width/2, height/2, 0);
    stroke(255); strokeWeight(3);
    rotateX(PI/2);
    rotateZ(-PI/6);
    noFill();
    
    beginShape();
    vertex(-s, -s, -s);
    vertex( s, -s, -s);
    vertex(   0,    0,  s);
    
    vertex( s, -s, -s);
    vertex( s,  s, -s);
    vertex(   0,    0,  s);
    
    vertex( s, s, -s);
    vertex(-s, s, -s);
    vertex(   0,   0,  s);
    
    vertex(-s,  s, -s);
    vertex(-s, -s, -s);
    vertex(   0,    0,  s);
    endShape();
}
