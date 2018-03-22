import processing.pdf.*;

String file = "library_viz_up.csv";
Table t;
ArrayList<PVector> paperRow = new ArrayList<PVector>();
ArrayList<Paper> Library = new ArrayList<Paper>();
int numPaper;
FloatDict scopeDict = new FloatDict();
int numMarker;
float angle;
float offset;
FloatList score = new FloatList();
float scoreMax,scoreMin,scoreRange;

//adjustment
float space = 3;
float radius = 2000;
float ctrlen = -100;
float arcthick = 50; 
float scopethick = 20;
int scoperange = 200;

int strokemax = 220;
int strokemin = 20;
float weightmax = 12;
float weightmin = 0.1;

/*
float fontsize = 12;
float fontboxWidth = 100 * 0.8;
float fontboxHeight = 3*fontsize;
*/

void setup(){
  //size(1200,1200);
  size(2400,2400,PDF, "studio_viz_circle.pdf");
  background(250);
    
  //set value for scope dict
  scopeDict.set("global",4);
  scopeDict.set("countries",4);
  scopeDict.set("country",3);
  scopeDict.set("state",2);
  scopeDict.set("city",1);
  scopeDict.set("farm",0);
  
  //process data
  processData(file);
  cal_Sim();
  angle = 2*PI/(numMarker+space*numPaper);
  offset = random(PI);
}

void draw(){
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(offset);
  for (int i=0;i<numPaper;i++){
    Library.get(i).display_graph(i);
    rotate(space*angle);
  }
  popMatrix();
  
  
  noFill();
  stroke(0);
  strokeWeight(1);
  pushMatrix();
  translate(width/2,height/2);
  rotate(offset);
  for (int m=0; m<numPaper-1;m++){
    for(int n=m+1; n<numPaper;n++){
    dis_Sim(m,n);
    }
  }
  popMatrix();
  
  noLoop();
  println("complete");
  exit();
}