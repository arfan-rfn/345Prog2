
// Md Arfan Uddin
// Mayank Gandhi
// CSc 345
// Prog #2
// The Rectangle object

import java.awt.geom.Line2D;
public class Rectangle {
    public float xMin, xMax, yMin, yMax;
    private color rectColor = color(#FFFFFF, 0);

    public Rectangle(float x1, float x2, float y1, float y2) {
        this.xMin = Math.min(x1, x2);
        this.xMax = Math.max(x1, x2);
        this.yMin = Math.min(y1, y2);
        this.yMax = Math.max(y1, y2);
    }

    boolean inside(PVector point) {
        if(point.x >= xMin && point.x <= xMax && point.y >= yMin && point.y <= yMax)
            return true;
        else
            return false;
    }
    
    public float area(){
      return (xMax - xMin) * (yMax - yMin);
    }
    
    public float width(){
      return xMax - xMin;
    }
    
    public float height(){
      return yMax - yMin;
    }
    
    public Rectangle topRight(){
      float avgX = (xMin + xMax)/2;
      float avgY = (yMin + yMax)/2;
      return new Rectangle(avgX, xMax, avgY, yMin);
    }
    public Rectangle topLeft(){
      float avgX = (xMin + xMax)/2;
      float avgY = (yMin + yMax)/2;
      return new Rectangle(xMin, avgX, yMin, avgY);
    }
    public Rectangle bottomRight(){
      float avgX = (xMin + xMax)/2;
      float avgY = (yMin + yMax)/2;
      return new Rectangle(avgX, xMax, avgY, yMax);
    }
    public Rectangle bottomLeft(){
      float avgX = (xMin + xMax)/2;
      float avgY = (yMin + yMax)/2;
      return new Rectangle(xMin, avgX, avgY, yMax);
    }
    
    public boolean Are_Intersecting(Segment seg){
      int x1 = (int) xMin;
      int x2 = (int) xMax;
      int y1 = (int) yMin;
      int y2 = (int) yMax;
      return inside(seg.getLeftPoint()) || inside(seg.getRightPoint()) ||
        Are_Intersecting(seg, new Segment(x1, x1, y1, y2)) ||
        Are_Intersecting(seg, new Segment(x1, x2, y1, y1)) ||
        Are_Intersecting(seg, new Segment(x1, x2, y2, y2)) ||
        Are_Intersecting(seg, new Segment(x2, x2, y1, y2)) ;
    }
    
   public boolean intersects(Rectangle rect){
      if (xMin > rect.xMax || xMax < rect.xMin) { 
            return false; 
      } 
  
      // If one rectangle is above other  
      if (yMin > rect.yMax || yMax < rect.yMin) { 
          return false; 
      }
      return true;
      //return (x1 <= xMax && xMax <= x2 && y1 <= yMax && yMax <= y2) ||
      //       (xMin <= x2 && x2 <= xMax && yMin <= y2 && y2 <= yMax) || 
      //       (xMin <= x2 && x2 <= xMax && yMin <= y1 && y1 <= yMax) ||
      //       (xMin <= x1 && x1 <= xMax && yMin <= y2 && y2 <= yMax) || 
      //       (xMin <= x1 && x1 <= xMax && yMin <= y1 && y1 <= yMax);
    }
    
   public void highlight() { rectColor = color(#0B2C0C, 30); }
   public void unhighlight() { rectColor = color(#FFFFFF, 0); }

    public void display() {
        stroke(#625F5F);
        strokeWeight(1);
        fill(rectColor);
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
      return " (x1: "+ xMin + ", x2: " + xMax + ", y1: " + yMin + ", y2: " + yMax + ") \n";
    }
}
