// Variable de la classe Timer
Timer t;

color bgColor = color(0);

void setup(){
  size(800, 800);
  
  // Timer de 10 segons
  t = new Timer(10);
}

void draw(){
  
  background(bgColor);
  
  // Actualitza el color de fons
  updateColor();
  
  fill(255); textSize(64); textAlign(CENTER);
  text(t.numSeconds, width/2, height/2);

}


void updateColor(){
  
  // Si s'ha esgotat el timer, canviam el color
  if(t.timeOver()){
    bgColor = color(random(255), random(255), random(255));
  }
  
  // Actualitza el timer
  t.update();
}
