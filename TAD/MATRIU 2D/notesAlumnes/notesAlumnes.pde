
int[][] notes = { { 98, 68, 65, 73, 67 },
                    { 77, 77, 88, 78, 90 },
                    { 53, 63, 74, 85, 72 },
                    { 77, 77, 68, 78, 91 },
                    { 88, 86, 90, 56, 81 }
                   };
                   
void setup(){
  
  for(int alumne = 0; alumne <= 4; alumne++){
    println("Alumne #"+alumne);
    for(int examen = 0; examen <= 4; examen++){
      print("\tEx #"+examen+ ": "+notes[alumne][examen]);
    }
    println();
  }
}
