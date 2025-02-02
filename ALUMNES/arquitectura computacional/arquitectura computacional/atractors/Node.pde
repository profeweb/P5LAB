class Node extends PVector {
  
  public PVector velocity = new PVector();
  PVector pVelocity = new PVector();
  public float maxVelocity = 10;
  public float damping = 0.5f;
  public float radius = 200;
  public float strength = -1;
  public float ramp = 1.0f;
  
  public Node(float theX, float theY) {
    x = theX;
    y = theY;
  }
  
  public void update() {
    update(false, false, false);
  }
  
  public void update(boolean theLockX, boolean theLockY, boolean theLockZ) {

    velocity.limit(maxVelocity);

    pVelocity = velocity.get();

    if (!theLockX) x += velocity.x;
    if (!theLockY) y += velocity.y;
    if (!theLockZ) z += velocity.z;


    velocity.mult(1 - damping);
  }
  
  public void setDamping(float theDamping) {
    this.damping = theDamping;
  }

}
