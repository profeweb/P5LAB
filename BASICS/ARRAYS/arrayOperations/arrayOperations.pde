// Arrays
int[] nums1 = {3, 7, 9, 2, 5};

void setup(){
  
  // Imprimeix les caselles de l'Array NUMS1
  impArray(nums1);
  
  // Calcula el màxim de l'Array NUM1
  println("MÀXIM: "+ maxArray(nums1));
  
  // Calcula el mínim de l'Array NUM1
  println("MÍNIM: "+ minArray(nums1));
  
  // Calcula la suma de l'Array NUM1
  println("SUMA: "+ sumaArray(nums1));
  
  // Calcula la mitjana de l'Array NUM1
  println("MITJA: "+ avgArray(nums1));
  
  // Calcula quants positius té l'Array NUM1
  println("POSITIUS: "+ posArray(nums1));
  
  // Calcula quants negatius té l'Array NUM1
  println("NEGATIUS: "+ negArray(nums1));
  
  // Calcula quants parells té l'Array NUM1
  println("PARELLS: "+ parArray(nums1));
}

// Imprimeix les caselles de l'Array en ordre ascendent
void impArray(int[] nums){
  for(int i=0; i<nums.length; i++){
    println(nf(i, 2, 0)+":["+nums[i]+"]");
  }
}

// Retorna el valor màxim de l'Array
int maxArray(int[] nums){
  int max = nums[0];
  for(int i=1; i<nums.length; i++){
    if(nums[i]>max){
      max= nums[i];
    }
  }
  return max;
}

// Retorna el valor mínim de l'Array
int minArray(int[] nums){
  int min = nums[0];
  for(int i=1; i<nums.length; i++){
    if(nums[i]<min){
      min= nums[i];
    }
  }
  return min;
}

// Calcula la suma de les caselles de l'Array
int sumaArray(int[] nums){
  int suma = 0;
  for(int i=1; i<nums.length; i++){
    suma += nums[i];
  }
  return suma;
}

// Calcula la mitjana de les caselles de l'Array
float avgArray(int[] nums){
  float suma = 0;
  for(int i=1; i<nums.length; i++){
    suma += nums[i];
  }
  return suma / nums.length;
}

// Calcula quants positius té l'Array
int posArray(int[] nums){
  int n = 0;
  for(int i=1; i<nums.length; i++){
    if(nums[i]>0){
      n++;
    }
  }
  return n;
}

// Calcula quants negatius té l'Array
int negArray(int[] nums){
  int n = 0;
  for(int i=1; i<nums.length; i++){
    if(nums[i]<0){
      n++;
    }
  }
  return n;
}

// Calcula quants parells té l'Array
int parArray(int[] nums){
  int n = 0;
  for(int i=1; i<nums.length; i++){
    if(nums[i]%2==0){
      n++;
    }
  }
  return n;
}

int[] cosesArray(int[] nums){
 
  int[] solucions = new int[3];
  
  for(int i=0; i<nums.length; i++){
    if(nums[i]>0){
      solucions[0]++;
    }
    if(nums[i]<0){
      solucions[1]++;
    }
    if(nums[i]%2==0){
      solucions[2]++;
    }
  } 
  return solucions;
}
