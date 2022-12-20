class Fletxa {
  
  PVector p, q;

  Fletxa(float x1, float y1, float x2, float y2){
    p = new PVector(x1, y1);
    q = new PVector(x2, y2);
  }
  
  float distance(){
    return p.dist(q);
  }
  
  float angle() {
        PVector a2 = p.copy().add(1, 0);
        float angle1 = atan2(a2.y - p.y, p.x - a2.x);
        float angle2 = atan2(q.y - p.y, p.x - q.x);
        float angle = (float) degrees(angle1 - angle2);
        if (angle < 0) angle += 360;
        if(angle>=360) angle-=360;
        return angle;
    }
  
  void display(color c){
    pushStyle();
    stroke(c); strokeWeight(3);
    line(this.p.x, this.p.y, this.q.x, this.q.y);
    
    float a = angle();
    float d = distance()/4;
    float a1 = radians(a-10);
    float fx1 = this.q.x - d*cos(a1);
    float fy1 = this.q.y - d*sin(a1);
    line(this.q.x, this.q.y, fx1, fy1);
    
    float a2 = radians(a+10);
    float fx2 = this.q.x - d*cos(a2);
    float fy2 = this.q.y - d*sin(a2);
    fill(c);
    triangle(this.q.x, this.q.y, fx1, fy1, fx2, fy2);
    popStyle();
  }
}
