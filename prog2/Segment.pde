public class Segment {
  int x1;
  int x2;
  int y;

  public Segment(int x1, int x2, int y) {
    this.x1 = x1;
    this.x2 = x2;
    this.y = y;
  }

  public void display() {
    stroke(255, 255, 255);
    strokeWeight(2);
    line(leftX, y, rightX, y);
  }
}
