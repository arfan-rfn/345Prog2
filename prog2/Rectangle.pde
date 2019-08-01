import java.awt.geom.Line2D;
public class Rectangle {
    public float xMin, xMax, yMin, yMax;

    public Rectangle(float x1, float x2, float y1, float y2) {
        this.xMin = Math.min(x1, x2);
        this.xMax = Math.max(x1, x2);
        this.yMin = Math.min(y1, y2);
        this.yMax = Math.max(y1, y2);
    }

    boolean inside(PVector point) {
        if(point.x>=xMin && point.x<xMax && point.y>=yMin && point.y<yMax)
            return true;
        else
            return false;
    }
    
    public float area(){
      return (xMax - xMin) * (yMax - yMin);
    }
    
    public Rectangle topRight(){
      float avgX = (xMin + xMax)/2;
      float avgY = (yMin + yMax)/2;
      return new Rectangle(avgX, xMax, avgY, yMax);
    }
    public Rectangle topLeft(){
      float avgX = (xMin + xMax)/2;
      float avgY = (yMin + yMax)/2;
      return new Rectangle(avgX, xMin, avgY, yMax);
    }
    public Rectangle bottomRight(){
      float avgX = (xMin + xMax)/2;
      float avgY = (yMin + yMax)/2;
      return new Rectangle(avgX, xMax, avgY, yMin);
    }
    public Rectangle bottomLeft(){
      float avgX = (xMin + xMax)/2;
      float avgY = (yMin + yMax)/2;
      return new Rectangle(avgX, xMin, avgY, yMin);
    }
    
    public boolean Are_Intersecting(Segment seg){
      int h = (int)(xMax - xMin);
      int w = (int)(yMax - yMin);
      int x1 = (int) xMin;
      int x2 = (int) xMax;
      int y1 = (int)yMin;
      int y2 = (int) yMax;
      return inside(seg.getLeftPoint()) ||
        Are_Intersecting(seg, new Segment(x1, y1, x2, y1)) ||
        Are_Intersecting(seg, new Segment(x1, y1, x1, y2)) ||
        Are_Intersecting(seg, new Segment(x2, y1, x2, y2)) ||
        Are_Intersecting(seg, new Segment(x1, y2, x2, y2))
      ;
    }

    public boolean existsInRegion() {
      // TODO: need to implement
      return false;
    }

    public void highlight() {
        stroke(#D82A38);
        strokeWeight(2);
        //fill(3,42,31,0);
        noFill();
        rect(xMin, yMin, xMax - xMin, yMax - yMin);
    }
    
    public boolean Are_Intersecting(Segment l1, Segment l2){
        String[] coordsStrs = {String.valueOf(l1.x1),String.valueOf(l1.y1),
                String.valueOf(l1.x2),String.valueOf(l1.y2),String.valueOf(l2.x1),String.valueOf(l2.y1),
        String.valueOf(l2.x2), String.valueOf(l2.y2)};
        Double[] cDs = new Double[8];
        for (int i = 0; i < 8; i++) cDs[i] = Double.parseDouble(coordsStrs[i]);
        
        return Line2D.linesIntersect(cDs[0],cDs[1],cDs[2],cDs[3],cDs[4],cDs[5],cDs[6],cDs[7]);
    }
    
    public String toString(){
      return "x1: "+ xMin + ", x2: " + xMax + ", y1: " + yMin + ", y2: " + yMax;
    }
}
