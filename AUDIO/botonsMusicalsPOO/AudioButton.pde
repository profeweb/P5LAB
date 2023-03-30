import processing.sound.*;

class AudioButton {

  SoundFile so;
  Button rb;

  AudioButton(PApplet p5, String nomSo, float x, float y, float r, color c) {
    this.so = new SoundFile(p5, nomSo);
    if (random(1)<0.5) {
      rb = new RectButton(x, y, 2*r, 2*r, c, 0);
    }
    else {
      rb = new RoundButton(x, y, 2*r, 2*r, c, nomSo);
    }
  }

  void display() {
    rb.display();
  }

  void playSound() {
    if (rb.mouseDins()) {
      so.play();
    }
  }
}
