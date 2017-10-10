void display_similarity(int m, int n){
  float arclength;
  float posX1 = graphX.get(m);
  float posX2 = graphX.get(n);
  float posX = (posX1+posX2) / 2;
  arclength = posX2 - posX1;
  
  float sScore = score.get((numPaper-1+(numPaper-m))*m/2+(n-1-m));
  //float ScoreStroke = (sScore-scoreMin) / scoreRange * (strokemax-strokemin) + strokemin;
  float ScoreStroke = (strokemax-strokemin)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1);
  
  //float ScoreWeight = weightmult*((sScore-scoreMin) / scoreRange * (weightmax-weightmin) + weightmin);
  float ScoreWeight = (weightmax-weightmin)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1)*((sScore-scoreMin) / scoreRange * (1-0.1) + 0.1);
  //stroke attribute
  noFill();
  stroke(0,0,0,ScoreStroke);
  strokeWeight(ScoreWeight);
  
  //draw arc
  arc(posX,height*PosY-5,arclength,arclength*0.7,PI,2*PI);

}