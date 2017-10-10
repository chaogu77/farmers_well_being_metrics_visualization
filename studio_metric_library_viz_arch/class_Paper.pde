class Paper{
  //local vaiable
  PVector paper;
  float posX,posY,weightHS,scopeValue;
  String paperName;
  int numMarkers;
  String alpha = "FF";
  /*
  String[] Dimlist;
  IntDict Dimension = new IntDict();
  int[] DimensionList;
  */
  IntDict Similarity = new IntDict();
  int begin;
  int end;
  float arcsize;
  
  //constructor
  Paper (PVector _paper) {
    paper = _paper;
    
    begin = int(paper.x);
    end = int(paper.y);
    paperName = t.getRow(begin).getString("paper");
    scopeValue = scopeDict.get(t.getRow(begin).getString("scope"));
    numMarkers = end-begin;
     
    for (int i= begin; i<end ;i++){
      TableRow row = t.getRow(i);
      //String dimension = row.getString("dimension");
      //Dimension.increment(dimension);

      String hashtag = row.getString("hashtag");
      String[] Hashtag = split(hashtag, "," );
      for (int j=0; j< Hashtag.length; j++){
         Similarity.increment(Hashtag[j]);         
      }
    }
    
    //DimensionList = Dimension.valueArray();
    //Dimlist = Dimension.keyArray();

  }

  void display_graph(float posX,float posY,float space1, float space2, float blockheight){
    pushMatrix();  
    strokeCap(SQUARE);
    weightHS = numMarkers * 0.07;
    strokeWeight(weightHS);
    rectMode(CENTER);
    translate(posX,posY);
    
    //hemi-sphere
    fill(255);
    rotate(PI);
    arcsize = scopeValue*diameter-weightHS;
    for (int i=0; i<numMarkers;i++){
      String col = alpha+t.getRow(begin+i).getString("hexcode");
      int col_d = unhex(col);
      stroke(col_d); //should be adjusted by the color assigned by the dimension
      float angle = PI/numMarkers;
      arc(0,0,arcsize,arcsize,0,angle); 
      rotate(angle);
    }
    
    noStroke();
    //blocks
    float posBoxY = space1 + 0.5*blockheight;
    
    for(int i=0; i<numMarkers;i++){
      String col = alpha+t.getRow(begin+i).getString("hexcode");
      int col_d = unhex(col);
      fill(col_d);
      rect(0,posBoxY,arcsize+weightHS,blockheight); //should be adjusted by the citation
      posBoxY = posBoxY +space2 + blockheight;
    }

    //rotate(PI);
    
    fill(0);
    textAlign(CENTER,CENTER);
    text(paperName,0,-fontsize * fontOffsetR,arcsize*fontboxWidthR,fontboxHeight);  //should be adjusted
    popMatrix();
    
  }
}