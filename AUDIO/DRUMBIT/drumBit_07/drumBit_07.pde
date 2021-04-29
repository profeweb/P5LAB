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

// Array to stroe the audio files
SoundFile[] sample;

// Two-dimensional array to stroke tracks
boolean[][] track;

// Array to store if tracks are enable or disable
boolean[] enable = {true, true, true, true, true};

// Boolean variable to play or pause music
boolean playMusic = false;

void setup() {
  size(1600, 800);
  smooth(16);

  // Load audio files
  loadSoundFiles();

  // Load tracks
  loadRandomTracks();
}

void draw() {
  background(155);

  // Display cursor
  displayCursor(width-100, 5);

  // Display Tracks
  displayTracks();

  // Play Music
  if (playMusic && frameCount%speed==0) {
    playTracks();
    moveCursor();
  }
}

// Moves cursor one step forward
void moveCursor() {
  cursor++;
  if (cursor>15) {
    cursor = 0;
  }
}


// Loads audio files into the array sample
void loadSoundFiles() {
  sample = new SoundFile[numTracks];
  for (int i=0; i<numTracks; i++) {
    sample[i] = new SoundFile(this, audioFile[i]);
  }
}

// Loads Tracks using Randomness
void loadRandomTracks() {
  track = new boolean[numTracks][numBits];
  for (int i=0; i<numTracks; i++) {
    loadRandomBits(i);
  }
}

// Loads a Track
void loadRandomBits(int nt) {
  for (int i=0; i<numBits; i++) {
    float r = random(1);
    boolean b = false;
    if (r<0.5) {
      b = true;
    }
    track[nt][i] = b;
  }
}

// Plays the tracks samples
void playTracks() {
  for (int i=0; i<numTracks; i++) {
    if (enable[i]) {
      playTrack(i);
    }
  }
}

// Plays a track
void playTrack(int nt) {
  if (track[nt][cursor]) {
    sample[nt].play();
  }
}

// Displays all tracks
void displayTracks() {
  for (int i=0; i<numTracks; i++) {
    displayTrack(i, 50, 50 + 150*i, width-100, 100, 5);
  }
}


// Display a track
void displayTrack(int n, float x, float y, float w, float h, float s) {

  // Calculates width of every bit circle
  float ww = (w - (numBits-1)*s) / (float)numBits; 

  // Displays track number
  fill(0); 
  textSize(38); 
  textAlign(CENTER);
  text(n, x - 25, y + h/2);

  // Display every bit of the track 
  for (int i=0; i<numBits; i++) {

    stroke(50); 
    strokeWeight(2);
    if (track[n][i]==false) {
      fill(255);
    } else if (enable[n] && cursor==i && playMusic) {
      fill(255, 0, 255);
    } else if (enable[n]) {
      fill(200, 255, 0);
    } else {
      fill(100, 100, 100);
    }
    ellipse(x + i*(ww+s) + ww/2, y + ww/2, ww, ww);

    // Displays bit number
    fill(0); 
    textSize(18);
    text(i, x + i*(ww+s) + ww/2, y-s);
  }
}


// Displays the cursor
void displayCursor(float w, float s) {
  float ww = (w - (numBits-1)*s) / (float)numBits; 
  float x = 50 + cursor*(ww+s);
  stroke(255, 0, 255); 
  strokeWeight(15);
  line(x + ww/2, 0, x+ww/2, height);
}

// Mouse interaction
void mousePressed() {
  for (int i=0; i<numTracks; i++) {
    mousePressedOnTrack(i);
  }
}

void mousePressedOnTrack(int i) {
  //displayTrack(i,50,50 + 150*i,width-100,100, 5);
  float x = 50;
  float y = 50 + 150*i;
  float s = 5;
  float w = width - 100;
  float ww = (w - (numBits-1)*s) / (float)numBits; 
  if (mouseX>x && mouseX<x+w && 
      mouseY>= y && mouseY< y +100) {
      for (int b=0; b<numBits; b++) {
        //ellipse(x + i*(ww+s) + ww/2, y + ww/2, ww, ww);
        float d = dist(mouseX, mouseY, x + b*(ww+s) + ww/2, y + ww/2);
        if (d<ww/2) {
          track[i][b] = !track[i][b];
        }
      }
  }
}

void emptyTracks(){
  for(int t=0; t<numTracks; t++){
    for(int b=0; b<numBits; b++){
      track[t][b] = false;
    }
  }
}



// Keyboard interaction
void keyPressed() {
  if (key=='p' || key=='P') {
    playMusic = !playMusic;
  } else if (key=='r' || key=='R') {
    loadRandomTracks();
  } else if (key=='0') {
    enable[0] = !enable[0];
  } else if (key=='1') {
    enable[1] = !enable[1];
  } else if (key=='2') {
    enable[2] = !enable[2];
  } else if (key=='3') {
    enable[3] = !enable[3];
  } else if (key=='4') {
    enable[4] = !enable[4];
  } else if (key=='5') {
    emptyTracks();
  }
}
