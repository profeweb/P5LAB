
String[] csv;
String[][] data;

// Colors de barres i/o sectors
color[] colors = {color(51,102,204), color(220,57,18), color(255,153,0), color(16,150,24), color(153, 0, 153)};

int numQuestion = 0;
int numQuestions = 20;
int numMaxOptions = 6;

// Array de Preguntes
Question[] questions;


void setup(){
  size(1800, 900);
  loadData("Test salut mental.csv");
}


// Llegir dades del fitxer CSV
void loadData(String file){
  
  // Llegir les línies
  csv = loadStrings(file);
  
  // LLegir les columnes
  data = new String[csv.length][21];
  for(int f=0; f<csv.length; f++){
    data[f] = csv[f].split(",");
  }
  
  
  // Afegint les preguntes
  questions = new Question[numQuestions];
  for(int i=1; i<=numQuestions; i++){
    String q = data[0][i];
    questions[i-1]=new Question(i,q, numMaxOptions, csv.length);
  }
  
  // Afegint les respostes
  for(int f=1; f<csv.length; f++){
    for(int c=1; c<=numQuestions; c++){
      String answer = data[f][c];
      questions[c-1].addAnswer(answer);
    }
  }
  
  // Calculant percentatge d'opcions
  for(int i=0; i<questions.length; i++){
    questions[i].calculateAvgs();
  }
  
  
}


void draw(){
  background(245);
  displayQuestion(numQuestion);
  displayNumQuestion(numQuestion);
  displayNumEnquestats(csv.length-1);
}


// Mostrar el Número d'Enquestats
void displayNumEnquestats(int n){
  fill(0); textAlign(RIGHT);
  text("Enquestats: "+n, width-50, height-30);
}

// Mostrar el Número de la Pregunta
void displayNumQuestion(int n){
  fill(0); textAlign(RIGHT);
  text((n+1)+" de "+numQuestions, width-50, 50, 30);
}


// Mostrar el Text, Opcions i Gràfics de la Pregunta
void displayQuestion(int n){
  Question q = questions[n];
  q.drawQuestion(50,50);
  q.drawChart(2*width/3 + 150, height/2 , 320, true);
  q.drawBars(80, height - 30, 120, height/1.5);
  q.drawStacks(width/2 - 150, height-30, 150, height - 100);
}


// Passar a la Següent o Anterior Pregunta amb les Arrow Keys
void keyPressed(){
  if((keyCode==UP || keyCode==RIGHT) && numQuestion<numQuestions-1){
    numQuestion++;
  }
  else if((keyCode==DOWN || keyCode==LEFT) && numQuestion>0){
    numQuestion--;
  }
}
