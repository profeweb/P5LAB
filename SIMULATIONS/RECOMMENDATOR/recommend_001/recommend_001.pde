import java.util.*;

Usuari u1, u2, u3;
Item p1, p2, p3, p4;

List<String> itemNames = Arrays.asList("P1", "P2", "P3", "P4", "P5");
List<Item> items; 

List<String> userNames = Arrays.asList("Paco", "Maria", "Xesc", "Joana");
List<Usuari> users;

HashMap<Usuari, HashMap<Item, Double>> inputData;
HashMap<Usuari, HashMap<Item, Double>> outputData;
HashMap<Item, Map<Item, Double>> diff;
HashMap<Item, Map<Item, Integer>> freq;


void setup(){
  
  size(1800, 800);
  
  items = new ArrayList<Item>();
  for(String n : itemNames){
    items.add(new Item(n));
  }
  
  users = new ArrayList<Usuari>();
  for(String u : userNames){
    users.add(new Usuari(u));
  }
  
  initData();
  
  println("Valoració de Paco del producte P1:" + valoracio(inputData,"Paco","P1"));
  println("Valoració de Maria del producte P2:" + valoracio(inputData,"Maria","P2"));

  buildDifferencesMatrix(inputData);
  
  outputData = new HashMap<Usuari, HashMap<Item, Double>>();
  predict(inputData);
}


void draw(){
  background(255);
  
  displayData(inputData, 100, 100);
  displayData(outputData, 800, 100);
}
