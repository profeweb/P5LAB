
float[] ratios = {0.2, 0.2, 0.2, 0.2, 0.2};
int[] iterations = {1, 2, 3, 4 ,5 ,6};
ArrayList<PVector> dots1;
ArrayList<PVector>[] chaikins;

void setup() {
  size(1080, 1080);
  
  dots1 = new ArrayList<PVector>();
  dots1.add(new PVector(50, 200));
  dots1.add(new PVector(300, 400));
  dots1.add(new PVector(600, 100));
  dots1.add(new PVector(840, 300));
  
  chaikins = new ArrayList[5];
  for(int i=0; i<chaikins.length; i++){
    chaikins[i] = chaikin(dots1, ratios[i], iterations[i], false);
  }
}
  
void draw() {
  
  background(255);
  fill(0); textSize(18); textAlign(RIGHT);
  text("ORIGINAL CURVE", width-50, 200);
  displayCurve(dots1, color(0), 5);
  
  for(int i=0; i<chaikins.length; i++){
    pushMatrix();
    translate(0, 200 + i*100);
    text("RATIO: "+ ratios[i], width-50, 300);
    text("ITERATIONS: "+ iterations[i], width-50, 320);
    displayCurve(chaikins[i], color(255, 0, 0), 5);
    popMatrix();
  }

}

void displayCurve(ArrayList<PVector> points, color c, float s){
  pushStyle();
  noFill(); stroke(c); strokeWeight(s);
  beginShape();
  for(PVector p : points){
    vertex(p.x, p.y);
  }
  endShape();
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
