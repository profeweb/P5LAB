import processing.sound.*;

class MusicPlayer {
  
  // Posició
  float x, y;
  
  // Botons del reproductor
  Button bPlay, bStop, bPause, bLoop;
  
  // So, títol i percentage de reproducció
  SoundFile so;
  String sTitle;
  float percentage;
  
  // Constructor
  MusicPlayer(float x, float y){
    this.x = x; this.y = y;
    bPlay = new Button("PLAY", this.x, this.y, 100, 50);
    bStop = new Button("STOP", this.x + 150, this.y, 100, 50);
    bPause = new Button("PAUSE", this.x + 300, this.y, 100, 50);
    bLoop = new Button("LOOP", this.x + 450, this.y, 100, 50);
    this.percentage = 0;
  }
  
  // Setter del so del reproductor
  void setSound(PApplet p5, String s){
    sTitle = s;
    so = new SoundFile(p5, s); 
  }
  
  
  // Dibuixa el reproductor
  void display(){
    
    pushStyle();
    stroke(200, 100, 100); strokeWeight(8);
    fill(100); rectMode(CORNER);
    rect(this.x -50, this.y-200, 650, 300, 5);
    
    stroke(0); strokeWeight(5); 
    line(this.x, this.y - 50, this.x + 550, this.y - 50);
    stroke(200, 100, 100); strokeWeight(8);
    
    
    float llarg = 0;
    if(so!=null){
      this.percentage = so.position()/ so.duration();
      llarg = this.percentage * 550;
    }
    
    textAlign(CENTER); fill(0); textSize(16);
    text(nf(this.percentage * 100, 2, 2) +"%", this.x + 300, this.y -80);
    line(this.x, this.y -50, this.x + llarg, this.y -50);
    
    textSize(24);
    text(this.sTitle, this.x + 300, this.y -120);
    
    // Dibuixa botons del reproductor de música
    bPlay.display();
    bStop.display();
    bPause.display();
    bLoop.display();
    
    popStyle();
  }
  
  
  // Comprova els botons del repoductor
  void checkButtons(){
    
    if(bPlay.mouseOverButton() && !so.isPlaying()){
      so.play();
    }
    else if(bPause.mouseOverButton() && so.isPlaying()){
      so.pause();
    }
    else if(bStop.mouseOverButton() && so.isPlaying()){
      so.stop();
    }
    else if(bLoop.mouseOverButton()){
      so.loop();
    }
  }
  
  // Comprova si el cursor està sobre els botons
  boolean mouseOverButtons(){
    return bPlay.mouseOverButton() ||
           bStop.mouseOverButton() || 
           bPause.mouseOverButton() || 
           bLoop.mouseOverButton();
  }
  
}
