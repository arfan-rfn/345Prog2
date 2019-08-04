// Md Arfan Uddin
// Mayank Gandhi
// CSc 345
// Prog #2
// implementation of Quad Tree with segments, and query on rectange

boolean animationMode = true;
boolean insertMode = false;
boolean reportMode = false;
boolean countMode = false;
boolean firstQueryPoint = false;
boolean secQueryPoint = true;

int pixels = 0;
int countEnd = 0;

int queryX1 = 0;
int queryY1 = 0;
int queryX2 = 0;
int queryY2 = 0;

String customMsg = "";

QuadTree tree;

ArrayList<Segment> segments = new ArrayList();

ArrayList<Rectangle> rectangles = new ArrayList();

// setup the whole page and ask for input file
void setup(){
  size(520, 650);
  smooth();
  drawSegmentsFromFile("./inputFiles/random_segments.in");
  showStatus();
  tree = new QuadTree(0, 512, 0, 512, pixels);
  for(Segment seg: segments) {
    tree.insert(seg);
  }
  //println("Select default input file or close the window to select default file './doIntersect.in'");
  //println("h = " + rectangles.size());
  //println("rects = " + rectangles);
  
  //println(tree.root.topRight().getSegment().size());
} 


// refresh the window 
void draw(){
  stroke(255);
  fill(255);
  rect(0, 0, 520, 650);
  
   //draw each segment
  for(Segment seg: segments) {
    seg.display();
  }
  
  for(Rectangle rect: rectangles){
    if(!animationMode){
      rect.unhighlight();
    }
    rect.display();
  } 
  
  if(reportMode || countMode){
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

  showStatus();
}

// take a mouse event
void mousePressed(){
  //println(mouseX + ", " + mouseY);
  
  if(insertMode){
    if(mouseX <= 512 && mouseY <= 512){
      Segment tempSeg = new Segment(mouseX, mouseX, mouseY);
      segments.add(tempSeg);
      tree.insert(tempSeg);
    }
  }
  
  if(reportMode){
    if(!firstQueryPoint){
      firstQueryPoint = true;
      secQueryPoint = false;
      queryX1 = mouseX;
      queryY1 = mouseY;
    }else{
      firstQueryPoint = false;
      secQueryPoint = true;
      queryX2 = mouseX;
      queryY2 = mouseY;
      tree.query(new Rectangle(queryX1, queryX2, queryY1, queryY2));
      customMsg = "";
    }
  }
  
    if(countMode){
      if(!firstQueryPoint){
        firstQueryPoint = true;
        secQueryPoint = false;
        queryX1 = mouseX;
        queryY1 = mouseY;
      }else{
        firstQueryPoint = false;
        secQueryPoint = true;
        queryX2 = mouseX;
        queryY2 = mouseY;
        tree.queryEndPoint(new Rectangle(queryX1, queryX2, queryY1, queryY2));
        customMsg = "";
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
      reportMode = false;
      countMode = false;
      println("Insert mode: " + insertMode);
  }
  if(key == 'r' || key == 'R'){
      insertMode = false;
      reportMode = !reportMode;
      countMode = false;
      resetReport();
      if(reportMode){
        customMsg = "Draw a rectangel from the mouse point";
      }else{
        customMsg = "";
      }
      println("Report Mode: "+ reportMode);
  }
  if(key == 'c' || key == 'C'){
      insertMode = false;
      reportMode = false;
      countEnd = 0;
      countMode = !countMode;
      resetCount();
      if(countMode){
        customMsg = "Draw a rectangel from the mouse point";
      }else{
        customMsg = "";
      }
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

// process each event on mouse or key pressed
void resetCount(){
    firstQueryPoint = false;
    secQueryPoint = true;
}

void showStatus(){
  fill(#C68C1E);
  text(customMsg, 30, height - 100);
  fill(0, 102, 153);
  text("Animation Mode : " + animationMode, 30, height-80);
  text("Insert Mode : " + insertMode, 30, height-60);
  text("Report Mode : " + reportMode, 30, height-40);
  text("Count Mode : " + countMode, 30, height-20);
  
  if(countMode){
    text("End Point counts : " + countEnd, 290, height-20);
  }
}
