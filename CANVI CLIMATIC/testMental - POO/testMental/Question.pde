

class Question {
  
  int num;   // Número de la Pregunta
  String question;  // Text de la Pregunta
  
  int numOptions = 0;  // Número d'Opcions
  String[] options;    // Array d'Opcions
  
  int numAnswers = 0;  //Número de Respostes
  int[] answers;      // Array d'Opcions Respostes
  
  float[] avgs;      // Array de percentatges
  
  // Constructor de Pregunta
  Question(int n, String q, int numMaxOption, int numMaxAnswers){
    
    this.num = n;
    this.question = q;
    
    // Inicialitza els Arrays
    options = new String[numMaxOption];
    avgs    = new float[numMaxOption];
    answers = new int[numMaxAnswers];
  }
  
  // Afegeix una opció possible a la pregunta
  void addOption(String o){
    if(numOptions<options.length){
      options[numOptions] = o;
      numOptions++;
    }
  }
  
  // Afegeix una resposta a la pregunta 
  void addAnswer(String a){
    if(numAnswers<answers.length){
      boolean newOption = true;
      for(int i=0; i<options.length; i++){
        if(options[i]!=null && options[i].equals(a)){
          answers[i]++;
          newOption = false;
          break;
        }
      }
      if(newOption){
        addOption(a);
        answers[options.length-1]=1;
      }
      numAnswers++;
    }
  }
  
  // Calcula els percentatges
  void calculateAvgs(){
    for(int i=0; i<numOptions; i++){
      avgs[i] = (answers[i]/(float)numAnswers)*100.0;
    }
  }
  
  // Dibuixa el text i opcions d'una Pregunta
  void drawQuestion(float x, float y){
    fill(0); textSize(32); textAlign(LEFT);
    text(num+") "+question, x, y);
    
    for(int i=0; i<numOptions; i++){
      Option o = new Option(options[i], x+30, y + 50 + i*50, 20, colors[i]);
      o.display();
    }
  }
  
  
  // Dibuixa Gràfic de Sectors 
  void drawChart(float x, float y, float r, boolean hole){
    
    float ang=0.0;
    for(int i=0; i<numOptions; i++){
      float a = map(avgs[i], 0.0, 100.0, 0, TWO_PI);
      Sector s = new Sector(x, y, r, colors[i], avgs[i],ang, ang+a);
      s.display();
      ang+=a+0.02;
    }
    
    if(hole){
      stroke(255); fill(235);
      ellipse(x, y, r, r);
    }
  }
  
  // Dibuixa Diagrama de Barres
  void drawBars(float x, float y, float wb, float maxH){
    for(int i=0; i<numOptions; i++){
      float h = map(avgs[i], 0.0, 100.0, 0, maxH);
      Bar b = new Bar(x + wb*i, y, wb, h, colors[i], avgs[i]);
      b.display();
    }
  }
  
  
  // Dibuixa Diagrama de Piles
  void drawStacks(float x, float y, float wb, float maxH){
    float hh = 0;
    for(int i=0; i<numOptions; i++){
      float h = map(avgs[i], 0.0, 100.0, 0, maxH);
      hh += h;
      Stack s = new Stack(x, y-hh, wb, h, colors[i], avgs[i]);
      s.display();      
    }
  }
  
  
}
