class Segment{
  int leftX;
  int rightX;
  int y;
  private color lineColor = color(182,125,67);

  Segment(int x1, int x2, int y){
    leftX = x1;
    rightX = x2;
    this.y = y;
    
  }
  
   public void highlight() { lineColor = color(64,20,60); }
   public void unhighlight() { lineColor = color(182,125,67); }

  void display(){
    stroke(lineColor);
    strokeWeight(2);
    line(leftX, y, rightX, y);
    ellipse(leftX, y, 4, 4);
    ellipse(rightX, y, 4, 4);
  }
}
