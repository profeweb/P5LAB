import processing.sound.*;

// Number of tracks
int numTracks = 5;

// Number of bits of a track
int numBits = 16;

// Cursor position
int cursor = 0;

// Play music speed (bps)
int speed = 10;

// Array to store the audio files names
String[] audioFile = {"snare.wav", "clap.wav", "laser.wav", "ding.wav", "cow.wav"};

// Stores the audio file information
SoundFile[] sample;

// Two-dimensional array to stroke tracks
boolean[][] track;

// Boolean variable to play or pause music
boolean playMusic = false;

void setup(){
  size(1600, 800);
  
  // Loads audio files
  loadSoundFiles();
  
  // Loads tracks
  loadRandomTracks();
  
}

void draw(){
  background(155);
  
  // Display cursor
  displayCursor(width-100, 5);
  
  // Play Music
  if(playMusic && frameCount%speed==0){
    playTracks();
    moveCursor();
  }
  
  // Display Tracks
  displayTracks();
  
}

// Moves cursor one step forward
void moveCursor(){
  cursor++;
  if(cursor>15){
    cursor = 0;
  }
}

// Loads audio files into the samples
void loadSoundFiles(){
  sample = new SoundFile[numTracks];
  for(int i=0; i<numTracks; i++){
    sample[i] = new SoundFile(this, audioFile[i]);
  }
}

// Loads Track using Randomness
void loadRandomTracks(){
  track = new boolean[numTracks][numBits];
  for(int i=0; i<numTracks; i++){
    loadRandomBits(i);
  }
}

// Loads a Track
void loadRandomBits(int nt){
  for(int i=0; i<numBits; i++){
    float r = random(1);
    boolean b = false;
    if(r<0.5){
      b = true;
    }
    track[nt][i] = b;
  }
}

// Displays the cursor
void displayCursor(float w, float s){
  float ww = (w - (numBits-1)*s) / (float)numBits; 
  float x = 50 + cursor*(ww+s);
  stroke(255,0,255); strokeWeight(15);
  line(x + ww/2, 0, x+ww/2, height);
}


// Plays all tracks
void playTracks(){
  for(int i=0; i<numTracks; i++){
      playTrack(i);
  }
}

// Plays a track
void playTrack(int nt){
  if(track[nt][cursor]){
    sample[nt].play();
  }
}

// Displays all tracks
void displayTracks(){
  for(int i=0; i<numTracks; i++){
    displayTrack(i,50,50 + 150*i,width-100,100, 5);
  }
}


// Display a track
void displayTrack(int n, float x, float y, float w, float h, float s){
  
  // Calculates width of every bit circle
  float ww = (w - (numBits-1)*s) / (float)numBits; 
  
  // Display every bit of the track 
  for(int i=0; i<numBits; i++){
    
    stroke(50); strokeWeight(2);
    if(track[n][i]==false){
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
