

class AudioKeyBoard {

  AudioButton[] abs;

  String[] nomsAudios = {"dj.wav", "clap.wav", "guitar.wav", 
    "saxo.wav", "snare.wav"};

  color[] colors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), 
    color(255, 255, 0), color(0, 255, 255)};

  AudioKeyBoard(int n, float x, float y, float w, PApplet p5) {
    abs = new AudioButton[n];
    float r = (w/ (float)n)/2;
    for (int i=0; i<n; i++) {
      float xx = x + r*(2*i+1); 
      abs[i] = new AudioButton(p5, nomsAudios[i], xx, y, r, colors[i%colors.length]);
    }
  }

  void display() {
    for (int i=0; i<abs.length; i++) {
      abs[i].display();
    }
  }

  void playSounds() {
    for (int i=0; i<abs.length; i++) {
      abs[i].playSound();
    }
  }
}
