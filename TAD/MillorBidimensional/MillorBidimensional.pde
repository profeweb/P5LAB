float[][] notes = {
                      { 7.5, 5.6, 8.3, 9.2, 5.6 },
                      { 6.2 },
                      { 2.5, 3.5, 4.9, 7.3, 4.5 },
                  };
                  
String[] alumnes = {"Pere", "Maria", "Jaume"};
                                  
void setup(){
  
  int millorAlumne = 0;
  float millorMitjana = 0;
  
  for(int f=0; f< notes.length; f++){
    
    float mitjana = 0;
    
    for(int c=0; c< notes[f].length; c++){
        float nota = notes[f][c];  
        mitjana += nota;
    }
    
    mitjana /= notes[f].length;
    
    if(mitjana > millorMitjana){
      millorMitjana = mitjana;
      millorAlumne  = f;
    }
    
  }
  
  println("Alumne amb millor mitjana: " + alumnes[millorAlumne]);
}
