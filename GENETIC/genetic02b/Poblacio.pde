class Population {

  float mutationRate;          // Mutation rate
  Coet[] population;         // Array to hold the current population
  ArrayList<Coet> matingPool;    // ArrayList which we will use for our "mating pool"
  int generations;             // Number of generations

   // Initialize the population
   Population(float m, int num) {
    mutationRate = m;
    population = new Coet[num];
    matingPool = new ArrayList<Coet>();
    generations = 0;
    //make a new set of creatures
    for (int i = 0; i < population.length; i++) {
      PVector position = new PVector(width/2,height+20);
      population[i] = new Coet(position, new DNA());
    }
  }

  void live () {
    // Run every rocket
    for (int i = 0; i < population.length; i++) {
      population[i].run();
    }
  }

  // Calculate fitness for each creature
  void fitness() {
    for (int i = 0; i < population.length; i++) {
      population[i].fitness();
    }
  }

  // Generate a mating pool
  void selection() {
    // Clear the ArrayList
    matingPool.clear();

    // Calculate total fitness of whole population
    float maxFitness = getMaxFitness();

    // Calculate fitness for each member of the population (scaled to value between 0 and 1)
    // Based on fitness, each member will get added to the mating pool a certain number of times
    // A higher fitness = more entries to mating pool = more likely to be picked as a parent
    // A lower fitness = fewer entries to mating pool = less likely to be picked as a parent
    for (int i = 0; i < population.length; i++) {
      float fitnessNormal = map(population[i].getFitness(),0,maxFitness,0,1);
      int n = (int) (fitnessNormal * 100);  // Arbitrary multiplier
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }

  // Making the next generation
  void reproduction() {
    // Refill the population with children from the mating pool
    for (int i = 0; i < population.length; i++) {
      // Sping the wheel of fortune to pick two parents
      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));
      // Pick two parents
      Coet mom = matingPool.get(m);
      Coet dad = matingPool.get(d);
      // Get their genes
      DNA momgenes = mom.getDNA();
      DNA dadgenes = dad.getDNA();
      // Mate their genes
      DNA child = momgenes.crossover(dadgenes);
      // Mutate their genes
      child.mutate(mutationRate);
      // Fill the new population with the new child
      PVector position = new PVector(width/2,height+20);
      population[i] = new Coet(position, child);
    }
    generations++;
  }

  int getGenerations() {
    return generations;
  }

  // Find highest fintess for the population
  float getMaxFitness() {
    float record = 0;
    for (int i = 0; i < population.length; i++) {
       if(population[i].getFitness() > record) {
         record = population[i].getFitness();
       }
    }
    return record;
  }

}
