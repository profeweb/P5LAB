float[][] notes = {
                      { 7.5, 5.6, 8.3, 9.2, 5.6 },
                      { 6.2 },
                      { 2.5, 3.5, 4.9, 7.3, 4.5 },
                  };
                                  
void setup(){
  
  for(int f=0; f< notes.length; f++){
    println("ALUMNE Nº"+f);
    float suma = 0;
    for(int c=0; c< notes[f].length; c++){
        float nota = notes[f][c];  
        suma += nota;                    // suma = suma + nota;
    }
    suma /= notes[f].length;             // suma = suma / 4;
    println("\tMITJANA DE NOTES:"+suma);
  }
}
