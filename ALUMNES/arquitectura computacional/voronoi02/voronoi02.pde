import toxi.math.conversion.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.geom.mesh2d.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.math.noise.*;
import toxi.processing.*;

ToxiclibsSupport gfx;
Voronoi voronoi;

ArrayList<PVector> dots;
ArrayList<ArrayList<PVector>> polys;

void setup() {
  size(1080, 1080, P2D);
  gfx = new ToxiclibsSupport( this );
  dots = new ArrayList();
  
  setRandomDots(50, 0, 0, width, height);
  println(dots.size());
  applyVoronoi();
}

void setRandomDots(int n, float x, float y, float w, float h){
  do {
    float xr = random(x, x + w);
    float yr = random(y, y + w);
    dots.add(new PVector(xr, yr));
  } while(dots.size()!=n);
}

void setCircleDots(int n, float xc, float yc, float r){
  float angleStep = TWO_PI / (float) n;
  float angle = 0;
  do {
    float xr = xc + r*cos(angle) + random(-10, 10);
    float yr = yc + r*sin(angle) +  random(-10, 10);
    dots.add(new PVector(xr, yr));
    angle += angleStep;
  } while(angle < TWO_PI);
}

void applyVoronoi(){
  voronoi = new Voronoi();
  for (PVector p : dots) {
        voronoi.addPoint(new Vec2D(p.x, p.y));
        println(p.x+" "+p.y);
  }
}
  
void draw() {
  background(0);
  fill(0); strokeWeight(3); stroke(255);

  for (Polygon2D polygon : voronoi.getRegions()) {
        
        beginShape();
        fill(0);
        for(Vec2D v : polygon.vertices){
          //vertex(v.x, v.y);
        }
        endShape(CLOSE);
        
        ArrayList<PVector> points = new ArrayList<PVector>();
        for(Vec2D v : polygon.vertices){
          points.add(new PVector(v.x, v.y));
        }
        
        ArrayList<PVector> poly2 = chaikin(points, 0.13, 2, true);
        beginShape();
        noFill(); stroke(255, 0, 0); 
        for(PVector v : poly2){
          vertex(v.x, v.y);
        }
        endShape(CLOSE);
        
        
        Vec2D c = polygon.getCentroid();
        fill(255);
        //circle(c.x, c.y, 5);
  }
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
