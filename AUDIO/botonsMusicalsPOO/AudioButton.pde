import processing.sound.*;

class AudioButton {
  
  SoundFile so;
  RectButton rb;
  
  AudioButton(PApplet p5, String nomSo, float x, float y, float r, color c){
    this.so = new SoundFile(p5, nomSo);
    rb = new RectButton(x, y, 2*r, 2*r, c, 1);
  }
  
  void display(){
    rb.display();
  }
  
  void playSound(){
    if(rb.mouseDins()){
      so.play();
    }
  }
  
}
