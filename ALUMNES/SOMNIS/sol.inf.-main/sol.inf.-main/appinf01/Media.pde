// Elements Multimèdia de l'APP
// Imatges, tipografies, sons, ...

import processing.sound.*;

// Imatges
PImage imgAfegir, imgFons, imgUsuari;
// Tipografies
PFont font1, font2, font3;
// Audios
SoundFile audio1, audio2, audio3;

// Càrrega dels elements multimèdia
void loadMedia(){
  loadImages();
 // loadFonts();
 // loadSounds();
}

// Càrrega de les Imatges
void loadImages(){
  imgAfegir = loadImage("../data/imgs/Afegir.png");
  imgAfegir = loadImage("../data/imgs/Usuari.png");
  imgAfegir = loadImage("../data/imgs/Logo.PNG");
  //imgFons = loadImage("../DATA/imgs/fonsTrivio.png");
}

// Càrrega de les Tipografies
void loadFonts(){
  font1 = createFont("../DATA/fonts/Sweet Creamy.ttf", 32);
  font2 = createFont("../DATA/fonts/secrcode.ttf", 32);
  font3 = createFont("../DATA/fonts/Fluo Gums.ttf", 32);
}

// Càrrega dels àudios
void loadSounds(){
  audio1 = new SoundFile(this, "../DATA/audios/click.wav");
  audio2 = new SoundFile(this, "../DATA/audios/correcte.wav");
  audio3 = new SoundFile(this, "../DATA/audios/error.wav");
}
