void cal_diameterHS(){
  int sumScope = 0;
  for (int i=0;i<numPaper;i++){
    sumScope += Library.get(i).scopeValue;
    //println(Library.get(i).scopeValue);
  }
  
  diameter = (width-Space3*(numPaper+1))/sumScope;
  
  //println("diameter",diameter);

}