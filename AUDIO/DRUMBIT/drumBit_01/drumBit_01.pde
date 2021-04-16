import processing.sound.*;

// Stores the audio file name
String audioFile = "snare.wav";

// Stores the audio file information
SoundFile sample;


// Boolean variable to play or pause music
boolean playMusic = false;

void setup(){
  size(1600, 800);
  
  // Load audio file
  loadSoundFile();
  
}

void draw(){
  background(155);
  
  // Play Music
  if(playMusic){
    playTrack();
  }
}

// Loads audio file into the sample
void loadSoundFile(){
  sample = new SoundFile(this, audioFile);
}

// Plays a track
void playTrack(){
    sample.play();
}

// Keyboard interaction
void keyPressed(){
  if(key=='p' || key=='P'){
    playMusic = !playMusic;
  }  
}
