class Paper{
  //local vaiable
  PVector paper;
  float scopeValue;
  String paperName;
  int numMarkers;
  String alpha = "FF";
  IntDict Similarity = new IntDict();
  int begin;
  int end;
  PVector anchor;
  PVector control;
  float scopeStroke;
  
  //constructor
  Paper (PVector _paper) {
    paper = _paper;
    
    begin = int(paper.x);
    end = int(paper.y);
    paperName = t.getRow(begin).getString("paper");
    scopeValue = scopeDict.get(t.getRow(begin).getString("scope"));
    scopeStroke = scoperange-scopeValue*scoperange/4;
    numMarkers = end-begin+1;
    //println(numMarkers);
    
    //create dict for similarity 
    for (int i= begin; i<end ;i++){
      String hashtag = t.getRow(i).getString("hashtag");
      String[] Hashtag = split(hashtag, "," );
      for (int j=0; j< Hashtag.length; j++){
         Similarity.increment(Hashtag[j]);         
      }
    }
    
  }

  void display_graph(int index){  
    //arc
    strokeCap(SQUARE);
    noFill();
    
    pushMatrix();
    for (int i=0; i<numMarkers;i++){
      String col = alpha+t.getRow(begin+i).getString("hexcode");
      int col_d = unhex(col);
      stroke(col_d); 
      strokeWeight(arcthick);
      arc(0,0,radius,radius,0,angle); 
      stroke(scopeStroke);
      strokeWeight(scopethick);
      arc(0,0,radius+arcthick+scopethick*0.5,radius+arcthick+scopethick*0.5,0,angle);
      rotate(angle);
    }
    popMatrix();
        
    /*
    //blocks
    noStroke();
    rectMode(CENTER);
    float posBoxY = space1 + 0.5*blockheight;
    
    for(int i=0; i<numMarkers;i++){
      String col = alpha+t.getRow(begin+i).getString("hexcode");
      int col_d = unhex(col);
      fill(col_d);
      rect(0,posBoxY,arcsize+scopeValue*1.2,blockheight);
      posBoxY = posBoxY +space2 + blockheight;
    }
    */
    
    /*
    pushMatrix();
    rotate(numMarkers*angle*0.5);
    
    stroke(0);
    noFill();
    strokeWeight(2);
    
    line(0,0,radius*0.5,0);
    translate(radius*0.5,0);
    rotate(PI*0.5);
    
    fill(0);
    textAlign(CENTER,CENTER);
    text(paperName,0,0,fontboxWidth,fontboxHeight);
    popMatrix();
    */
    
    float anchorAngle = angle*(begin+space*index+numMarkers*0.5);
    float anchorrad = radius*0.5-0.5*arcthick;
    anchor = new PVector (anchorrad*cos(anchorAngle),anchorrad*sin(anchorAngle));
    
    //tangient
    //float controlAngle = anchorAngle + atan(ctrlen / radius*2);
    //float controlrad = sqrt(pow((radius*0.5),2)+pow((ctrlen),2));
    
    //perpendicular
    float controlrad = anchorrad+ctrlen;
    float controlAngle = anchorAngle;
    
    control = new PVector (controlrad*cos(controlAngle),controlrad*sin(controlAngle));
    
    /*
    stroke(0);
    noFill();
    strokeWeight(1);
    line(anchor.x,anchor.y,control.x,control.y);
    */
    
    rotate(angle*numMarkers);
  }
}