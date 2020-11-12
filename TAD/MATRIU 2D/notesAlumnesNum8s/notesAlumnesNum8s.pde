
int[][] notes = { { 98, 68, 65, 73, 67 },
                  { 77, 77, 88, 78, 90 },
                  { 53, 63, 74, 85, 72 },
                  { 77, 77, 68, 78, 91 },
                  { 88, 86, 90, 56, 81 }
                };
                   
void setup(){
  
  int num8sTotal = 0;
  
  for(int alumne = 0; alumne <= 4; alumne++){
    
    println("Alumne #"+alumne);
    
    for(int examen = 0; examen <= 4; examen++){
      
      int nota = notes[alumne][examen];
      
      int num8s = 0;
      int x = nota;
      while(x > 0){
        
        if(x % 10 == 8){
          num8s++;
          num8sTotal++;
        }
        
        x = x / 10 ;
      }
      
      println("\tLa nota #"+examen+" té "+num8s+" vuits.");
    }
    println();
  }
  
  println("En total, hi ha "+num8sTotal+" vuits.");
}
