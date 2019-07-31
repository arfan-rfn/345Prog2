/**
 * Md Arfan Uddin & Mayank Gandhi
 * CSc 345 | Summer 2019
 * Implementation Homework #2
 */

// setup the whole page and ask for input file
void setup()  {
  size(800, 800);
  smooth();
  println("Select default input file or close the window to select default file './input.in'");
}

// refresh the window 
void draw(){
  stroke(255);
  fill(255);
  rect(0, 0, 800, 800);
}

// take a mouse event
void mousePressed(){
  processEvent();
}

// take a keyboard input
void keyPressed(){
  processEvent();
}

// process each event on mouse or key pressed
void processEvent(){
  println("presend");
}
