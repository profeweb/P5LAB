class Attractor {

  float x=0, y=0; 
  float radius = 100;
  float strength = 1;  
  float ramp = 0.15;    //// 0.01 - 0.99


  Attractor(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void attract(Node theNode) {
    // calculate distance
    float dx = x - theNode.x;
    float dy = y - theNode.y;
    float d = mag(dx, dy);

    if (d > 0 && d < radius) {
      // calculate force
      float s = pow(d / radius, 1 / ramp);
      float f = s * 9 * strength * (1 / (s + 1) + ((s - 3) / 4)) / d;

      // apply force to node velocity
      theNode.velocity.x += dx * f;
      theNode.velocity.y += dy * f;
      theNode.velocity.z -= min(dx, dy) * f;
    }
  }

}
