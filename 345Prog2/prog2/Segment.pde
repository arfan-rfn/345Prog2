class Segment{
  int leftX;
  int rightX;
  int y;

  Segment(int x1, int x2, int y){
    leftX = x1;
    rightX = x2;
    this.y = y;
  }


  void display(){
    stroke(255, 255, 255);
    strokeWeight(2);
    line(leftX, y, rightX, y);
  }
}
