public class Segment {
  int x1;
  int x2;
  int y;

  private color lineColor = color(182, 125, 67);

  public Segment(int x1, int x2, int y) {
    this.x1 = x1;
    this.x2 = x2;
    this.y = y;
  }

  public PVector getLeftPoint() {
    return new PVector(Math.min(x1, x2), y);
  }

  public PVector getRightPoint() {
    return new PVector(Math.max(x1, x2), y);
  }

  public void highlight() {
    lineColor = color(64, 20, 60);
  }

  public void unhighlight() {
    lineColor = color(182, 125, 67);
  }

  void display() {
    stroke(lineColor);
    strokeWeight(2);
    line(x1, y, x2, y);
    ellipse(x1, y, 4, 4);
    ellipse(x2, y, 4, 4);
  }
}
