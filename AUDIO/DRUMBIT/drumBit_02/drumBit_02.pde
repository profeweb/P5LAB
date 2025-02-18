import processing.sound.*;

// Number of bits of a track
int numBits = 16;

// Stores the audio file name
String audioFile = "snare.wav";

// Stores the audio file information
SoundFile sample;

// Array to store track information
boolean[] track;

// Boolean variable to play or pause music
boolean playMusic = false;

void setup(){
  size(1600, 800);
  
  // Load audio file
  loadSoundFile();
  
  // Load track
  loadRandomTrack();
  
}

void draw(){
  background(155);
  
  // Play Music
  if(playMusic){
    playTrack();
  }
  
  // Display Track
  displayTrack(50, 50, width - 100, 100, 20);
  
}

// Loads audio file into the sample
void loadSoundFile(){
  sample = new SoundFile(this, audioFile);
}

// Loads Track using Randomness
void loadRandomTrack(){
  track = new boolean[numBits];
  loadRandomBits();
}

// Loads a Track
void loadRandomBits(){
  for(int i=0; i<numBits; i++){
    float r = random(1);
    boolean b = false;
    if(r<0.5){
      b = true;
    }
    track[i] = b;
  }
}

// Plays a track
void playTrack(){
    sample.play();
}

// Display a track
void displayTrack(float x, float y, float w, float h, float s){
  
  // Calculates width of every bit circle
  float ww = (w - (numBits-1)*s) / (float)numBits; 
  
  // Display every bit of the track 
  for(int i=0; i<numBits; i++){
    
    stroke(50); strokeWeight(2);
    if(track[i]==false){
      fill(255);
    }
    else {
      fill(100, 100, 100);
    }
    ellipse(x + i*(ww+s) + ww/2, y + ww/2, ww, ww);
    
    // Displays bit number
    fill(0); textSize(18);
    text(i, x + i*(ww+s) + ww/2 , y-s);
  }
}

// Keyboard interaction
void keyPressed(){
  if(key=='p' || key=='P'){
    playMusic = !playMusic;
  }  
}
