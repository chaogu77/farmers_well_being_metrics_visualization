void processData(String data){
  String PaperName="";
  String prePaperName="";
  t = loadTable(data,"header");
  IntList x = new IntList();
  x.append(0);
  for (int i=0; i<t.getRowCount()-1; i++){
    TableRow row = t.getRow(i);
    TableRow row2 = t.getRow(i+1);
    prePaperName = row.getString("paper");
    PaperName = row2.getString("paper");
    if (PaperName.equals(prePaperName) == false){
      x.append(i+1);
    } 
  }
  for (int i=0;i<x.size()-1;i++){
    paperRow.add(new PVector (x.get(i), x.get(i+1)-1));
  }
  paperRow.add(new PVector (x.get(x.size()-1), t.getRowCount()-1));
  
  numPaper = paperRow.size();
    
  for (int i=0; i<numPaper;i++){
    Paper p = new Paper(paperRow.get(i));
    //add citation to a new IntList as arclength
    Library.add(p);
  }  
}