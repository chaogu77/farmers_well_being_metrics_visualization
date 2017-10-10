import processing.pdf.*;

//global variable

//paper
String file = "library_viz.csv";
Table t;
ArrayList<PVector> paperRow = new ArrayList<PVector>() ;
int numPaper;
ArrayList<Paper> Library = new ArrayList<Paper>();
FloatList score = new FloatList();
float scoreMax,scoreMin,scoreRange;
FloatDict scopeDict = new FloatDict();
IntDict dimCol = new IntDict();
float scopelength;

//adjustment
FloatList graphX = new FloatList();
float Space1 = 5; //between arc and block
float Space2 = 1; //between blocks
float Space3 = 5; //between arcs
float BlockHeight =2; 
float PosY=0.7;
int strokemax = 220;
int strokemin = 20;
float weightmax = 8;
float weightmin = 0.1;


//font
float fontsize=5;
float fontboxWidthR = 0.7;
float fontboxHeight = fontsize * 5;
float fontOffsetR = 1;

//backup
float diameter;
color[] palette = {#467F71, #BEDB39, #FFE87A, #FF893B, #E52738, #6B0C22, #2E0927, #730046};
String[] dimensionNew = {"wellbeing", "market", "finance", "practice", "environment", "science", "culture"};

void setup(){

  size(2400,1200,PDF, "studio_viz_mess_ZOOM.pdf");
  //size(2400,1200);
  //beginRecord(PDF,"viz.pdf");
  background(255);
  
  //set value for scope dict
  scopeDict.set("global",5);
  scopeDict.set("countries",5);
  scopeDict.set("country",4);
  scopeDict.set("state",3);
  scopeDict.set("city",2);
  scopeDict.set("farm",1);
  
  
  for (int i=0; i<dimensionNew.length;i++){
    dimCol.set(dimensionNew[i],i);
  }
  
  
  
  //import data,separate papers
  processData(file);
  //get similarity score
  cal_similarity();
  //calculate the length of hemi-sphere
  cal_diameterHS();
  //calculate the original X value for graph
  originX();
  
  //font style
  PFont f = createFont("Arial", fontsize);
  textFont(f);
  
}

void draw(){
  //loop through papers, run display
  //background(255);
  /*
  //draw similarity arc
  for (int m=0; m<numPaper-1;m++){
    for(int n=m+1; n<numPaper;n++){
      display_similarity(m,n);
    }
  }
  
  //draw arc and blocks below
  for(int i=0; i<numPaper;i++){
    Library.get(i).display_graph(graphX.get(i),PosY*height,Space1,Space2,BlockHeight);
  }
  
  */
  zoom_in(3,14,0.5,100,200,1,5,10,1,3,6,0.9,0.7,4); 
  //paper1,paper2,posYR,len,dist,strokeweight,blockheight,space1,space2,amp,fontsize,fontOffsetR,fontboxWidthR,fontboxHeight
  
  noLoop();
  
  println("Complete");
  exit();
}