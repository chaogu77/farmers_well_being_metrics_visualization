class paper{
  //variable
  PVector posPaper;
  int numMarkers;
  IntList edge = new IntList();
  IntList bol = new IntList();
  String name;
  float unit;
  float dd;
  float met;
  float pre_met;
  float txt;
  
  IntDict dim = new IntDict();
  
  //constructor
  paper(){
    numMarkers=t.getRowCount();
    name = t.getRow(0).getString("paper"); 
    
    for (int i=0; i<numMarkers;i++){
      String d = t.getRow(i).getString("dimension");
      dim.increment(d);
    }
       
    int[] value = dim.valueArray();
    bol.append(0);
    for(int i=0; i<value.length-1;i++){
      if(value[i]<value[i+1]){
        bol.append(0);
      }
      else{
        bol.append(1);
      }
    }


    edge.append(0);
    int sum=0;
    for (int i=0; i<value.length-1;i++){
      sum += value[i];
      edge.append(sum);
    }

  }
  
  
  //funtion
  void display(float _c,PVector _d, float _m, float _t){
    unit = 2*PI/numMarkers;
    //println(dim);
    //println(edge.size());
    //println(bol.size());
    //println (edge);
    
    pushMatrix();
    translate(0.5*width, 0.5*height);
    rotate(1.5*PI);
    int count=0;
    //dimension, metric, marker
    for (int i=0; i<numMarkers; i++){      
      //cal
      dd = dim.get(t.getRow(i).getString("dimension"));
      dd = (dd-scale.x) / (scale.y-scale.x)*(dimension.y-dimension.x)+dimension.x;
      met = dd+_m;
      txt = (met+numMarkers*r_met)/2+_t;
      
      //edge
      if (edge.hasValue(i)){
        stroke(80);
        strokeWeight(sw_met);
        if(bol.get(count) == 0){
          line(0,0,met/2,0);
        }
        if(bol.get(count) == 1){
          line(0,0,pre_met/2,0);
        }
        count ++;
      }
      
      //metric
      String m_col = "FF" + t.getRow(i).getString("hex2");
      int _col_m = unhex(m_col);
      fill(_col_m);
      stroke(80);
      strokeWeight(sw_met);
      //arc(0,0,met+numMarkers*r_met,met+numMarkers*r_met,0,unit);
      arc(0,0,met,met,0,unit);
      
      pre_met = met;
            
      //dimension
      noStroke();
      strokeWeight(sw_dim);
      String col = "FF" + t.getRow(i).getString("hex1");
      int _col = unhex(col);
      fill(_col);
      arc(0,0,dd,dd,0,unit);
      
      rotate(unit*0.5);
      //marker
      fill(0);
      String marker = t.getRow(i).getString("marker");
      textAlign(LEFT,CENTER);
      textSize(txtmarker);
      text(marker,txt,0);
      
      rotate(unit*0.5);
    }
    
    //last line
    stroke(0);
    strokeWeight(sw_met);
    line(0,0,met/2,0);
    
    popMatrix();
    
    pushMatrix();
    translate(0.5*width,0.5*height);
        
    //paper name
    fill(50);
    strokeWeight(sw_name);
    stroke(0);
    ellipse(0,0,_c,_c);
    noStroke();
    fill(255);
    rectMode(CENTER);
    textAlign(CENTER,CENTER);
    textSize(txtname);
    text(name,0,0,0.9*_c,0.9*_c);
    
    popMatrix();
    
  }
  
}