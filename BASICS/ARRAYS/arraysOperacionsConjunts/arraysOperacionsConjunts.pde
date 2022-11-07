// Arrays
int[] nums1 = {3, 7, 9, 2, 5};
int[] nums2 = {3, 5, 9, 1, 7};

void setup(){
  
  int[] resultat = unio2(nums1, nums2);
  printArray(resultat);
  
}

int[] unio(int[] a, int[] b ){
  int[] c = new int[a.length+b.length];
  for(int i=0; i<a.length; i++){
    c[i] = a[i];
  }
  int i = a.length;
  for(int k=0; k<b.length; k++){
    c[i] = b[k];
    i++;
  }
  return c;
}

int[] unio2(int[] a, int[] b ){
  int[] c = new int[a.length+b.length];
  for(int i=0; i<a.length; i++){
    c[i] = a[i];
  }
  int i = a.length;
  for(int k=0; k<b.length; k++){
    if(!hiEs(b[k], a)){
      c[i] = b[k];
      i++;
    }
  }
  return c;
}


boolean hiEs(int v, int[] a){
  for(int i=0; i<a.length; i++){
    if(a[i]==v){
      return true;
    }
  }
  return false;
}
