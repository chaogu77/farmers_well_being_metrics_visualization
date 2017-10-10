void originX(){
  float PosX = Space3 + diameter *  Library.get(0).scopeValue * 0.5;
  graphX.append(PosX);
  for (int i=1; i<numPaper;i++){
    PosX += Space3 + 0.5* diameter * (Library.get(i-1).scopeValue+Library.get(i).scopeValue);
    graphX.append(PosX);
  }
}