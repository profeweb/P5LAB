
void initData(){
  inputData = new HashMap<Usuari, HashMap<Item, Double>>();
  for(Usuari u : users){
    HashMap<Item, Double> valoracionsUsuari = new HashMap<Item, Double>();
    for(Item p : items){
      valoracionsUsuari.put(p, new Double(random(0,1)));
    }
    inputData.put(u, valoracionsUsuari);
  }
}


void displayData(HashMap<Usuari, HashMap<Item, Double>> data, float x, float y){
  
  textSize(24);
  float distCol = 100, distRow = 50;
  
  Usuari uTemp = users.get(0);
  HashMap<Item, Double> dataUserTemp = data.get(uTemp);
  int c = 1;
  for(Item i: dataUserTemp.keySet()){
    fill(0); text(i.nom, x + c*distCol, y);
    c++;
  }
  
  int f =1;
  for(Usuari u : data.keySet()){
    String userName = u.nom;
    fill(0); text(userName, x, y + f*distRow);
    HashMap<Item, Double> userData = data.get(u);
    c = 1;
    for(Item i : userData.keySet()){
      double v = userData.get(i);
      float vf = (float)v;
      text(nf(vf, 1, 3), x + c*distCol, y + f*distRow);
      c++;
    }
    f++;
  }
}


String valoracio(HashMap<Usuari, HashMap<Item, Double>> data, String un, String pn){
  Usuari u = users.get(userNames.indexOf(un));
  Item p   = items.get(itemNames.indexOf(pn));
  HashMap<Item, Double> dataUser = inputData.get(u);
  double v = dataUser.get(p);
  float vf = (float)v;
  return nf(vf, 1, 3);
}
