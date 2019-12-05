int lat = 10;
int lon = 5;

void setup() {
   size(800, 800,  P3D);
}

void draw() {
   background(255);
   
   translate(width/2,height/2,-200);
   rotateX(frameCount*0.01);
   
   lat = (int)map(mouseX, 0, width, 1, 20);
   lon = (int)map(mouseY, 0, height, 1, 20);
   sphereDetail(lat, lon);
   sphere(400);
}
