import processing.pdf.*;
//paper
String filename = "final_library.csv";
Table t;
int numDim;
ArrayList<PVector> dimRow = new ArrayList<PVector>();
//ArrayList<paper> library = new ArrayList<paper>();
PVector scale;
//PVector domain = new PVector(0.25,1);

//grid
/*
int r = 4;
int c = 5;
ArrayList<PVector> pos = new ArrayList<PVector>();
*/
//display
float pname = 200;
PVector dimension = new PVector (250,400);
float metric = 30;
float r_met = 0.2;
float marker = 1;

float sw_name = 1;
float sw_dim =0.1;
float sw_met =1;
color l_met = color (120);

//font
PFont f;
float txtmarker = 10;
float txtname = 30;

paper AML;

void setup(){
  processData();
  //grid(r,c);
  f = createFont("Century",1);
  
  size(2000,2000,PDF, "studio_viz4_2.pdf");
  //size(800,600);
  background(255);
  AML = new paper();
  
}

void draw(){
  AML.display(pname,dimension,metric,marker);
  noLoop();
  println("Complete");
  exit();
}