public class Rectangle {
    public float xmin, xmax, ymin, ymax;

    public Rectangle(float xmin, float ymin, float xmax, float ymax) {
        this.xmin = xmin;
        this.xmax = xmax;
        this.ymin = ymin;
        this.ymax = ymax;
    }

    public boolean contains(float x) {
        /**
         * Fill this!!!
         */
        return true;
    }

    public void highlight() {
        fill(random(0, 255), random(0, 255), random(0, 255));
        rect(xmin, ymin, xmax - xmin, ymax - ymin);
    }
}