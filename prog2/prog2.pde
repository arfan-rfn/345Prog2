// Md Arfan Uddin
// CSc 345
// Prog #1
// implementation of line sweep algorithm with skiplist and minheap

boolean animationMode = true;
boolean insertMode = false;
boolean reportMode = false;
boolean countMode = false;
boolean firstQueryPoint = false;
boolean secQueryPoint = true;
int queryX1 = 0;
int queryY1 = 0;
int queryX2 = 0;
int queryY2 = 0;

ArrayList<Segment> segments = new ArrayList();

// setup the whole page and ask for input file
void setup(){
  size(800, 800);
  smooth();
  drawSegmentsFromFile("./inputFiles/random_segments.in");
  
  println("Select default input file or close the window to select default file './doIntersect.in'");
} 


// refresh the window 
void draw(){
  stroke(255);
  fill(255);
  rect(0, 0, 800, 800);
  
  for(Segment seg: segments) {
    seg.highlight();
    seg.display();
  }
  
  if(reportMode){
    if(!firstQueryPoint){
      fill(#27495F);
      ellipse(mouseX,mouseY, 10, 10);
    }
    if(!secQueryPoint){
      stroke(157);
      fill(33, 97, 183, 63);
      int x1 = Math.min(queryX1, mouseX);
      int y1 = Math.min(queryY1, mouseY);
      int x2 = Math.max(queryX1, mouseX);
      int y2 = Math.max(queryY1, mouseY);
      rect(x1, y1, x2-x1, y2-y1);
    }
  }

}

// take a mouse event
void mousePressed(){
  println(mouseX + ", " + mouseY);
  
  if(insertMode){
    Segment tempSeg = new Segment(mouseX, mouseX, mouseY);
    segments.add(tempSeg);
  }
  
  if(reportMode){
    if(!firstQueryPoint){
      firstQueryPoint = true;
      secQueryPoint = false;
      queryX1 = mouseX;
      queryY1 = mouseY;
    }else{
      secQueryPoint = true;
      queryX2 = mouseX;
      queryY2 = mouseY;
    }
  }
}

// take a keyboard input
void keyPressed(){
  if(key == 'A' || key == 'a'){
      animationMode = !animationMode;
      println("Animation mode: " + animationMode);
  }
  if(key == 'i' || key == 'I'){
      insertMode = !insertMode;
      println("Insert mode: " + insertMode);
  }
  if(key == 'r' || key == 'R'){
      reportMode = !reportMode;
      resetReport();
      println("Report Mode: "+ reportMode);
  }
  if(key == 'c' || key == 'C'){
      countMode = !countMode;
      println("Count Mode:" + countMode);
  }
}

// process each event on mouse or key pressed
void resetReport(){
  if(!reportMode){
    firstQueryPoint = false;
    secQueryPoint = true;
  }
}
