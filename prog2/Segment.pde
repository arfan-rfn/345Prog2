public class Segment {
  float x1;
  float x2;
  float y;
  PVector p1, p2;

  public Segment(float x1, float x2, float y) {
    this.x1 = x1;
    this.x2 = x2;
    this.y = y;
    this.p1 = new PVector(x1,y);
    this.p2 = new PVector(x2,y);
  }

  public void display() {
    stroke(255, 255, 255);
    strokeWeight(2);
    line(x1, y, x2, y);
  }
}
