
void processData(){
  //variables
  t = loadTable(filename,"header");
  String dim="";
  String preDim="";
  IntList temp = new IntList();
  IntDict dimSize = new IntDict();
  
  //find row order
  temp.append(0);
  for (int i=0; i<t.getRowCount()-1; i++){
    TableRow row = t.getRow(i);
    TableRow row2 = t.getRow(i+1);
    preDim = row.getString("dimension");
    dim = row2.getString("dimension");
    if (dim.equals(preDim) == false){
      temp.append(i+1);
    } 
  }
  
  //convert list into vector
  for (int i=0;i<temp.size()-1;i++){
    dimRow.add(new PVector (temp.get(i), temp.get(i+1)-1));
  }
  dimRow.add(new PVector (temp.get(temp.size()-1), t.getRowCount()-1));
  
  //get num of dim
  numDim = dimRow.size();
  
  for (int i=0; i<t.getRowCount();i++){
    String dim_name = t.getRow(i).getString("dimension");
    dimSize.increment(dim_name);
  }
  
  int[] value = dimSize.valueArray();
  int max = max(value);
  int min = min(value);
  scale = new PVector(min,max);
  
  
  //println(paperRow);
  //println(numPaper);
  //println(scale);
}