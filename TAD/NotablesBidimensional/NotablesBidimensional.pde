float[][] notes = {
                      { 7.5, 5.6, 8.3, 9.2, 5.6 },
                      { 6.2 },
                      { 2.5, 3.5, 4.9, 7.3, 4.5 },
                  };
                                  
void setup(){
  int totalNOT = 0;
  for(int f=0; f< notes.length; f++){
    println("ALUMNE Nº"+f);
    int numNOT = 0;
    for(int c=0; c< notes[f].length; c++){
        float nota = notes[f][c];  
        if(nota >=7 && nota < 9){
          numNOT ++;
        }
    }
    println("\tNUM NOTABLES:"+numNOT);
    totalNOT += numNOT;
  }
  println("TOTAL NOTABLES:"+totalNOT);
}
