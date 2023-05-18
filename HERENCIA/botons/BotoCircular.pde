class BotoCircular extends Boto {
  
  BotoCircular(float x, float y, float w, float h, String t, color c){
    super( x,  y,  w,  h,  t,  c);
  }
  
  void display(){
    fill(this.c);
    
  }
  
}
