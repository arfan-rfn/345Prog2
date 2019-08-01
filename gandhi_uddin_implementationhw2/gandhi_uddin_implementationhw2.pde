/**
 * Md Arfan Uddin & Mayank Gandhi
 * CSc 345 | Summer 2019
 * Implementation Homework #2
 */

// setup the whole page and ask for input file
void setup()  {
  size(800, 800);
  background(0);
  smooth();
  println("Select default input file or close the window to select default file './input.in'");
}

// refresh the window 
void draw() {

}

// take a mouse event
void mousePressed(){
  initialize();
}

// take a keyboard input
void keyPressed(){
  initialize();
}

void initialize(){
  println("initializing");
  QuadTree o = new QuadTree();
  o.drawSegmentsFromFile("./inputFiles/1segment.in");
}

// process each event on mouse or key pressed
void processEvent()  {
  
}
