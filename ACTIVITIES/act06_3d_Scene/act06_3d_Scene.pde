
float angle;
int limit = 500;
Cube[] cubes = new Cube[limit];

void setup() {
  size(1000, 800, P3D); 
  background(0); 
  noStroke();

  for (int i = 0; i < cubes.length; i++){
    float x = random(-10, 10);
    float y = random(-10, 10);
    float z = random(-10, 10);
    float xs = random(-140, 140);
    float ys = random(-140, 140);
    float zs = random(-140, 140);
    cubes[i] = new Cube(x, y, z, xs, ys, zs);
  }
}

void draw(){
  background(0); 
  fill(200);

  pointLight(51, 102, 255, 65, 60, 100); 
  pointLight(200, 40, 60, -65, -60, -150);
  ambientLight(70, 70, 10); 

  translate(width/2, height/2, -200 + mouseX * 0.65);
  rotateY(radians(angle));
  rotateX(radians(angle));

  for (int i = 0; i < cubes.length; i++){
    cubes[i].drawCube();
  }
  
  angle += 0.2;
}
