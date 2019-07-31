public class Segment {
  float x1;
  float x2;
  float y;

  public Segment(float x1, float x2, float y) {
    this.x1 = x1;
    this.x2 = x2;
    this.y = y;
  }

  public void display() {
    stroke(255, 255, 255);
    strokeWeight(2);
    line(x1, y, x2, y);
  }
}
