void dis_Sim(int m, int n){ 
  float sScore = score.get((numPaper-1+(numPaper-m))*m/2+(n-1-m));
  
  float ScoreStroke = (strokemax-strokemin)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1);
  float ScoreWeight = (weightmax-weightmin)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1);
  
  //stroke attribute
  noFill();
  stroke(0,0,0,ScoreStroke);
  strokeWeight(ScoreWeight);
  
  //draw arc
  bezier(Library.get(m).anchor.x,Library.get(m).anchor.y,Library.get(m).control.x,Library.get(m).control.y,
  Library.get(n).control.x,Library.get(n).control.y,Library.get(n).anchor.x,Library.get(n).anchor.y);

}