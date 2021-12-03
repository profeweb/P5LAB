
TableLabel t;

String[][] info = { {"Titol 1", "Dada 1" }, {"Titol 1", "Dada 1" },
                    {"Titol 2", "Dada 2" }, {"Titol 2", "Dada 2" },
                    {"Titol 3", "Dada 3" }, {"Titol 3", "Dada 3" },
                    {"Titol 4", "Dada 4" }, {"Titol 4", "Dada 4" },
                    {"Titol 5", "Dada 5" }, {"Titol 5", "Dada 5" },
                    {"Titol 6", "Dada 6" }, {"Titol 6", "Dada 6" },
                  };

void setup(){
  size(1200, 800);
  t = new TableLabel(12);
  t.setLabelsInfo(info);
}


void draw(){
  background(255);
  t.display(25, 25, 800,600);  
  
}
