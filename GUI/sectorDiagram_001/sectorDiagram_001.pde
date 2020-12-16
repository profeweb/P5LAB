
SectorDiagram s;

String[] textos = {"WATER", "AIR", "FIRE", "EARTH"};
float[] values = {400, 600, 100, 300};
color[] colors = {color(0,0,255), color(50,50,200), 
                  color(255,0,0), color(0,255,0)};

void setup(){
  size(800,800);
  s = new SectorDiagram(width/2, height/2, width/3);
  s.setTexts(textos);
  s.setValues(values);
  s.setColors(colors);
}

void draw(){
  background(200, 100, 100);
  s.display();
}
