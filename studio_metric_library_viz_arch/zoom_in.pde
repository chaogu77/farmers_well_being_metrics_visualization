void zoom_in(int i, int j, float posYR, float len, float dist, float weight, float blockheight, float space1, float space2,float amp,float fontsize, float fontOffsetR,float fontboxWidthR,float fontboxHeightR){
  Paper p1 = Library.get(i);
  Paper p2 = Library.get(j);
  float posBoxY,posX;
  float len1 = p1.scopeValue*len;
  float len2 = p2.scopeValue*len;
  String alpha = "FF";
  //println(len1);
  //println(len2);
  
  //first similarity
  for (int x=0; x<i;x++){
    IntDict sim1 = Library.get(x).Similarity;
    IntDict sim2 = Library.get(i).Similarity;
    float num1 = Library.get(x).numMarkers;
    float num2 = Library.get(i).numMarkers;
    StringList common = new StringList();
    String[] sim1Key = sim1.keyArray();
    for (int z=0; z<sim1Key.length;z++){
      if (sim2.hasKey(sim1Key[z])){
        common.append(sim1Key[z]);
      }
    }
    float numShared = 0;
    for (int k=0; k< common.size();k++){
      numShared += sim1.get(common.get(k))/num1;
      numShared += sim2.get(common.get(k))/num2;
    }
      
    float sScore = numShared;
    float ScoreStroke = (strokemax-strokemin)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1);
    float ScoreWeight = (weightmax-weightmin)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1);
    //stroke attribute
    
    noFill();
    stroke(0,0,0,ScoreStroke);
    strokeWeight(ScoreWeight);
  
    //draw arc
    float arclength = dist*abs(x-i)*amp;
    posX = width/2-len1/2-dist/2-arclength/2;
    arc(posX,height*posYR-10,arclength,arclength,PI,2*PI);
  }
  
    //second similarity
    for (int x=j+1; x<numPaper;x++){
    IntDict sim1 = Library.get(x).Similarity;
    IntDict sim2 = Library.get(j).Similarity;
    float num1 = Library.get(x).numMarkers;
    float num2 = Library.get(j).numMarkers;
    StringList common = new StringList();
    String[] sim1Key = sim1.keyArray();
    for (int z=0; z<sim1Key.length;z++){
      if (sim2.hasKey(sim1Key[z])){
        common.append(sim1Key[z]);
      }
    }
    float numShared = 0;
    for (int k=0; k< common.size();k++){
      numShared += sim1.get(common.get(k))/num1;
      numShared += sim2.get(common.get(k))/num2;
    }
      
    float sScore = numShared;
    float ScoreStroke = (strokemax-strokemin)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1);
    float ScoreWeight = (weightmax-weightmin)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1);
    //stroke attribute
    
    noFill();
    stroke(0,0,0,ScoreStroke);
    strokeWeight(ScoreWeight);
  
    //draw arc
    float arclength = dist*abs(x-j)*amp;
    posX = width/2+len2/2+dist/2+arclength/2;
    arc(posX,height*posYR-10,arclength,arclength,PI,2*PI);
  }
  
    //internal similarity
    IntDict sim1 = Library.get(i).Similarity;
    IntDict sim2 = Library.get(j).Similarity;
    float num1 = Library.get(i).numMarkers;
    float num2 = Library.get(j).numMarkers;
    StringList common = new StringList();
    String[] sim1Key = sim1.keyArray();
    for (int z=0; z<sim1Key.length;z++){
      if (sim2.hasKey(sim1Key[z])){
        common.append(sim1Key[z]);
      }
    }
    float numShared = 0;
    for (int k=0; k< common.size();k++){
      numShared += sim1.get(common.get(k))/num1;
      numShared += sim2.get(common.get(k))/num2;
    }
      
    float sScore = numShared;
    float ScoreStroke = (strokemax-strokemin)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1);
    float ScoreWeight = (weightmax-weightmin)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1);
    //stroke attribute
    noFill();
    stroke(0,0,0,ScoreStroke);
    strokeWeight(ScoreWeight);
    //draw arc
    float arclength = dist+len1/2+len2/2;
    posX = width/2-len1/4+len2/4;
    arc(posX,height*posYR-10,arclength,arclength,PI,2*PI);

  
  

  //arc and block
  rectMode(CENTER);
  strokeCap(SQUARE);
  
  //first paper
  fill(255);
  pushMatrix();
  translate(width/2-len1/2-dist/2,posYR*height);
  rotate(PI);
  
  strokeWeight(p1.numMarkers*weight);
  for (int m=0; m<p1.numMarkers;m++){
    String col = alpha+t.getRow(p1.begin+m).getString("hexcode");
    int col_d = unhex(col);
    stroke(col_d); //should be adjusted by the color assigned by the dimension
    float angle = PI/p1.numMarkers;
    arc(0,0,len1,len1,0,angle); 
    rotate(angle);
  }
  noStroke();
  posBoxY = space1 + 0.5*blockheight;
  for(int k=0; k<p1.numMarkers;k++){
    String col = alpha+t.getRow(p1.begin+k).getString("hexcode");
    int col_d = unhex(col);
    fill(col_d);
    rect(0,posBoxY,len1+weight*p1.numMarkers,blockheight); //should be adjusted by the citation
    posBoxY = posBoxY +space2 + blockheight;
  }
  fill(0);
  textAlign(CENTER,CENTER);
  text(p1.paperName,0,-fontsize * fontOffsetR,len1*fontboxWidthR,fontboxHeightR*fontsize);
  popMatrix();
    
  //second paper
  fill(255);
  pushMatrix();
  translate(width/2+len2/2+dist/2,posYR*height);
  rotate(PI);
  strokeWeight(p2.numMarkers*weight/1.5);
  for (int m=0; m<p2.numMarkers;m++){
    String col = alpha+t.getRow(p2.begin+m).getString("hexcode");
    int col_d = unhex(col);
    stroke(col_d); //should be adjusted by the color assigned by the dimension
    float angle = PI/p2.numMarkers;
    arc(0,0,len2,len2,0,angle); 
    rotate(angle);
  }
  noStroke();
  posBoxY = space1 + 0.5*blockheight;
  for(int k=0; k<p2.numMarkers;k++){
    String col = alpha+t.getRow(p2.begin+k).getString("hexcode");
    int col_d = unhex(col);
    fill(col_d);
    rect(0,posBoxY,len2+weight*p2.numMarkers/1.5,blockheight); //should be adjusted by the citation
    posBoxY = posBoxY +space2 + blockheight;
  }
  fill(0);
  textAlign(CENTER,CENTER);
  textSize(fontsize);
  text(p2.paperName,0,-fontsize * fontOffsetR,len2*fontboxWidthR,fontboxHeightR*fontsize);
  popMatrix();
    
}