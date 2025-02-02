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

void setup() {
  size(1080, 1080, P2D);
  gfx = new ToxiclibsSupport( this );
  
  setRandomDots(50, 0, 0, width, height);
  applyVoronoi();
}

void setRandomDots(int n, float x, float y, float w, float h){
  dots = new ArrayList();
  do {
    float xr = random(x, x + w);
    float yr = random(y, y + w);
    dots.add(new PVector(xr, yr));
  } while(dots.size()!=n);
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
          vertex(v.x, v.y);
        }
        endShape(CLOSE);
        
        Vec2D c = polygon.getCentroid();
        fill(255);
        circle(c.x, c.y, 5);
  }
}
