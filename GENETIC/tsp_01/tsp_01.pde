
int numCities = 5;
String[] cities ={"A", "B", "C", "D", "E", "F", "G", "H"};
int[][] distance;
boolean[] visited;
ArrayList<String> path;

int minDistance = Integer.MAX_VALUE;

void setup() {

  size(800, 800);

  distance = new int[numCities][numCities];
  for (int i=0; i<distance.length; i++) {
    for (int j=0; j<distance.length; j++) {
      distance[i][j] = (int)random(2, 20);
    }
  }

  visited =  new boolean[numCities];
  for (int i=0; i<visited.length; i++) {
    visited[i] = false;
  }
  
  path = new ArrayList<String>();
  
  path.add(cities[0]);

  visited[0] = true;

  minDistance = find(distance, visited, 0, numCities, 1, 0, minDistance);  

  printDistances();
  
  println(minDistance);
  
  for(String s : path){
    println(s);
  }
}

void draw() {
}

void printDistances() {
  for (int i=0; i<numCities; i++) {
    for (int j=0; j<numCities; j++) {
      int d = (i==j)? 0 : distance[i][j];
      print(cities[i]+"->"+ cities[j] + ":" + d +"\t");
    }
    println();
  }
}

int find(int[][] distance, boolean[] visitCity, int currPos, int numCities, int count, int cost, int minD){  

  if (count == numCities && distance[currPos][0] > 0)   {  
    minD = Math.min(minD, cost + distance[currPos][0]);  
    return minD;
  }  

  // BACKTRACKING STEP  
  for (int i = 0; i < numCities; i++){  
    if (visitCity[i] == false && distance[currPos][i] > 0)   {  

      // Mark as visited  
      visitCity[i] = true;  
      
      minD = find(distance, visitCity, i, numCities, count + 1, cost + distance[currPos][i], minD);  

      // Mark ith node as unvisited  
      visitCity[i] = false;
    }
  }  
  
  return minD;
}  
