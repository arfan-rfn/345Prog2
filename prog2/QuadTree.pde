/**
 * QuadTreeNode:
 */
public class QuadTreeNode {
  /*
   * children[0] = top-right node 
   * children[1] = top-left node 
   * children[2] = bottom-right node 
   * children[3] = bottom-left node
   */
  QuadTreeNode[] children;
  private ArrayList<Segment> nodeSegments;
  private Rectangle rect;

  // Parameterized Constructor
  public QuadTreeNode(Rectangle rect) {
    nodeSegments = new ArrayList();
    this.children = new QuadTreeNode[4];
    for (int i = 0; i < 4; i++) {
      this.children[i] = null;
    }
    this.rect = rect;
  }

  public QuadTreeNode topRight() {
    return children[0];
  }

  public QuadTreeNode topLeft() {
    return children[1];
  }

  public QuadTreeNode bottomRight() {
    return children[2];
  }

  public QuadTreeNode bottomLeft() {
    return children[3];
  }

  public void addSegment(Segment seg) {
    nodeSegments.add(seg);
  }

  public ArrayList<Segment> getSegment() {
    return nodeSegments;
  }

  public Rectangle getRect() {
    return rect;
  }

  public boolean canHave(Segment seg) {
    return rect.Are_Intersecting(seg);
  }

  /**
   * QuadTree:
   */
  public class QuadTree {

    public QuadTreeNode root;
    int x1, x2, y1, y2, pixel;

    public QuadTree(int x1, int x2, int y1, int y2, int pixel) {
      this.x1 = x1;
      this.x2 = x2;
      this.y1 = y1;
      this.y2 = y2;
      this.pixel = pixel;
    }

    public void insert(Segment seg) {
      Rectangle rect = new Rectangle(x1, x2, y1, y2);
      insert(root, rect, seg);
    }

    private void insert(QuadTreeNode node, Rectangle rect, Segment seg) {
      //if(!rect.Are_Intersecting(seg)) return;
      if (!(rect.inside(seg.getLeftPoint()) && rect.inside(seg.getRightPoint())))
        return;

      if ((rect.xMax - rect.xMin) < (pixels))
        return;
      if (node == null) {
        node = new QuadTreeNode(rect);
        //rect.highlight();
        node.addSegment(seg);
      }
      //if(node.getSegment().size() >= 1){
      insert(node.topRight(), rect.topRight(), seg);
      insert(node.topLeft(), rect.topLeft(), seg);
      insert(node.bottomRight(), rect.bottomRight(), seg);
      insert(node.bottomLeft(), rect.bottomLeft(), seg);

      rectangles.add(rect.topRight());
      rectangles.add(rect.topLeft());
      rectangles.add(rect.bottomRight());
      rectangles.add(rect.bottomLeft());
      //}
    }

    /*
     * Split(v){ // Assumption – v is a leaf, but has too many segments in its list
     * // Create 4 children for v (make sure they know which region they cover.) For
     * each child u of v For each segment s in v.SegmentsList Call insert(s, u) }
     */
    public void split(QuadTreeNode n) {

    }

    /**
     * 
     * @param filename
     */
    public void drawSegmentsFromFile(String filename) {
      try {
        String str = null;
        BufferedReader read;
        read = createReader(filename);
        int lineCounter = 0;
        while ((str = read.readLine()) != null) {
          String[] words = str.split(",");
          println("value of line counter is" + lineCounter);
          println("size of words is :" + words.length);
          println(words);
          if (words.length > 2) {
            System.out.println(words);
            lineCounter = lineCounter + 1;
            int segX1 = Integer.parseInt(words[0]);
            int segX2 = Integer.parseInt(words[1]);
            int segY1 = Integer.parseInt(words[2]);
            Segment tempSeg = new Segment(segX1, segX2, segY1);
            tempSeg.display();
            /**
             * HINT: Add segment to QT here
             */
          } else {
            System.out.println(words);
          }
        }
      } catch (Exception e) {
        println("error occured");
        e.printStackTrace();
      }
    }
}
