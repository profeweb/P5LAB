
float[] ratios = {0.2, 0.3, 0.4};
int[] iterations = {2, 2, 2};
ArrayList<PVector> dots1;
ArrayList<PVector>[] chaikins;

void setup() {
  size(1080, 1080);
  
  dots1 = new ArrayList<PVector>();
  dots1.add(new PVector(40, 300));
  dots1.add(new PVector(150, 200));
  dots1.add(new PVector(200, 180));
  dots1.add(new PVector(220, 250));
  dots1.add(new PVector(260, 260));
  dots1.add(new PVector(360, 400));
  dots1.add(new PVector(220, 450));
  dots1.add(new PVector(150, 500));
  
  chaikins = new ArrayList[3];
  for(int i=0; i<chaikins.length; i++){
    chaikins[i] = chaikin(dots1, ratios[i], iterations[i], true);
  }
}
  
void draw() {
  
  background(255);
  fill(0); textSize(18); textAlign(RIGHT);
  
  pushMatrix();
  translate(50, 200);
  text("ORIGINAL SHAPE", 250, 150);
  displayShape(dots1, color(0), 5);
  popMatrix();
  
  translate(400, -350);
  for(int i=0; i<chaikins.length; i++){
    pushMatrix();
    translate(0, 200 + i*320);
    text("RATIO: "+ ratios[i], 500, 300);
    text("ITERATIONS: "+ iterations[i], 500, 320);
    displayShape(chaikins[i], color(255, 0, 0), 5);
    popMatrix();
  }

}

void displayShape(ArrayList<PVector> points, color c, float s){
  pushStyle();
  fill(c, 50); stroke(c); strokeWeight(s);
  beginShape();
  for(PVector p : points){
    vertex(p.x, p.y);
  }
  endShape(CLOSE);
  popStyle();
}

ArrayList<PVector> chaikinCut(PVector a, PVector b, float ratio){
  
  ArrayList<PVector> n = new ArrayList();
  ratio = (ratio > 0.5) ? (1 - ratio) : ratio;

  PVector p1 = PVector.lerp(a, b, ratio);
  n.add(p1);

  PVector p2 = PVector.lerp(b, a, ratio);
  n.add(p2);

  return n;
}

ArrayList<PVector> chaikin(ArrayList<PVector> shape, float ratio, int iterations, boolean closed){
  if(iterations==0){
    return shape;
  }
  else {
    ArrayList<PVector> nextShape = new ArrayList<PVector>();

    int numCorners = shape.size();
    if (!closed) {
      numCorners = shape.size() - 1;
    }

    for (int i = 0; i < numCorners; i++) {
      PVector a = shape.get(i);
      PVector b = shape.get((i + 1) % shape.size());

      ArrayList<PVector> n = chaikinCut(a, b, ratio);
      if (!closed && i == 0) {
          nextShape.add(a.copy());
          nextShape.add(n.get(1).copy());
      } else if (!closed && i == numCorners - 1) {
          nextShape.add(n.get(0).copy());
          nextShape.add(b.copy());
      } else {
          nextShape.add(n.get(0).copy());
          nextShape.add(n.get(1).copy());
      }
    }
    return chaikin(nextShape, ratio, iterations - 1, closed);
  }
}
