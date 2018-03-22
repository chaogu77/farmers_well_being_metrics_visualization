void cal_Sim(){
  for (int m=0; m<numPaper;m++){
    for (int n=m+1;n<numPaper;n++){ 
      IntDict sim1 = Library.get(m).Similarity;
      IntDict sim2 = Library.get(n).Similarity;
      float num1 = Library.get(m).numMarkers;
      float num2 = Library.get(n).numMarkers;
      StringList common = new StringList();
  
      String[] sim1Key = sim1.keyArray();
      for (int i=0; i<sim1Key.length;i++){
        if (sim2.hasKey(sim1Key[i])){
          common.append(sim1Key[i]);
        }
      }
      float numShared = 0;
      for (int k=0; k< common.size();k++){
        numShared += sim1.get(common.get(k))/num1;
        numShared += sim2.get(common.get(k))/num2;
      }
      score.append(numShared);
      //println(numShared);
    }
  }

  scoreMax = score.max();
  scoreMin = score.min();
  scoreRange = scoreMax - scoreMin;
  //println(score);
}