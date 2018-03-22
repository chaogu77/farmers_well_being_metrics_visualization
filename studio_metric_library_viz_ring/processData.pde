void processData(String data){
  String PaperName="";
  String prePaperName="";
  t = loadTable(data,"header");
  numMarker = t.getRowCount();
  //println(numMarker);
  
  IntList x = new IntList(); //a list to record the index of the row of papers
  
  x.append(0);
  for (int i=0; i<t.getRowCount()-1; i++){ //record the start index of papers
    prePaperName = t.getRow(i).getString("paper");
    PaperName = t.getRow(i+1).getString("paper");
    if (PaperName.equals(prePaperName) == false){
      x.append(i+1);
    } 
  }
  
  for (int i=0;i<x.size()-1;i++){ //generate pairs of paper index and store into pvector format
    paperRow.add(new PVector (x.get(i), x.get(i+1)-1));
  }
  paperRow.add(new PVector (x.get(x.size()-1), t.getRowCount()-1));
  
  numPaper = paperRow.size();
    
  for (int i=0; i<numPaper;i++){ //create paper class for each paper
    Paper p = new Paper(paperRow.get(i));
    Library.add(p);
  }  
}