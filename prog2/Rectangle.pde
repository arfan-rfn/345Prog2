public class Rectangle {
    public float xmin, xmax, ymin, ymax;

    public Rectangle(float xmin, float ymin, float xmax, float ymax) {
        this.xmin = xmin;
        this.xmax = xmax;
        this.ymin = ymin;
        this.ymax = ymax;
    }

    boolean containsPoint(PVector point) {
        if(point.x>=xmin && point.x<xmax && point.y>=ymin && point.y<ymax)
            return true;
        else
            return false;
    }

    public boolean existsInRegion() {
      // TODO: need to implement
      return false;
    }

    public void highlight() {
        fill(random(0, 255), random(0, 255), random(0, 255));
        rect(xmin, ymin, xmax - xmin, ymax - ymin);
    }
}
