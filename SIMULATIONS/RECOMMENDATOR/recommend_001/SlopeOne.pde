import java.util.Map.Entry;

void buildDifferencesMatrix(Map<Usuari, HashMap<Item, Double>> data) {

  diff = new HashMap<Item, Map<Item, Double>>();
  freq = new HashMap<Item, Map<Item, Integer>>();

  for (HashMap<Item, Double> user : data.values()) {
    for (Entry<Item, Double> e : user.entrySet()) {
      if (!diff.containsKey(e.getKey())) {
        diff.put(e.getKey(), new HashMap<Item, Double>());
        freq.put(e.getKey(), new HashMap<Item, Integer>());
      }
      for (Entry<Item, Double> e2 : user.entrySet()) {
        int oldCount = 0;
        if (freq.get(e.getKey()).containsKey(e2.getKey())) {
          oldCount = freq.get(e.getKey()).get(e2.getKey()).intValue();
        }
        double oldDiff = 0.0;
        if (diff.get(e.getKey()).containsKey(e2.getKey())) {
          oldDiff = diff.get(e.getKey()).get(e2.getKey()).doubleValue();
        }
        double observedDiff = e.getValue() - e2.getValue();
        freq.get(e.getKey()).put(e2.getKey(), oldCount + 1);
        diff.get(e.getKey()).put(e2.getKey(), oldDiff + observedDiff);
      }
    }
  }
  for (Item j : diff.keySet()) {
    for (Item i : diff.get(j).keySet()) {
      double oldValue = diff.get(j).get(i).doubleValue();
      int count = freq.get(j).get(i).intValue();
      diff.get(j).put(i, oldValue / count);
    }
  }
  //printArray(data);
}

void predict(Map<Usuari, HashMap<Item, Double>> data) {
  HashMap<Item, Double> uPred = new HashMap<Item, Double>();
  HashMap<Item, Integer> uFreq = new HashMap<Item, Integer>();
  for (Item j : diff.keySet()) {
    uFreq.put(j, 0);
    uPred.put(j, new Double(0.0));
  }
  for (Entry<Usuari, HashMap<Item, Double>> e : data.entrySet()) {
    for (Item j : e.getValue().keySet()) {
      for (Item k : diff.keySet()) {
        try {
          double predictedValue = diff.get(k).get(j).doubleValue() + e.getValue().get(j).doubleValue();
          double finalValue = predictedValue * freq.get(k).get(j).intValue();
          uPred.put(k, uPred.get(k) + finalValue);
          uFreq.put(k, uFreq.get(k) + freq.get(k).get(j).intValue());
        } 
        catch (NullPointerException e1) {
        }
      }
    }
    HashMap<Item, Double> clean = new HashMap<Item, Double>();
    for (Item j : uPred.keySet()) {
      if (uFreq.get(j) > 0) {
        clean.put(j, uPred.get(j).doubleValue() / uFreq.get(j).intValue());
      }
    }
    for (Item j : items) {
      if (e.getValue().containsKey(j)) {
        clean.put(j, e.getValue().get(j));
      } else if (!clean.containsKey(j)) {
        clean.put(j, new Double(-1.0));
      }
    }
    outputData.put(e.getKey(), clean);
  }
  //printData(outputData);
}
