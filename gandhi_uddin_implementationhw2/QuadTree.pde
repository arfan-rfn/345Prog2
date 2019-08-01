/**
 * QuadTreeNode:
 */
public class QuadTreeNode {
  QuadTreeNode[] children;
  Segment[] segments;
  Rectangle R;

  // Default Constructor
  public QuadTreeNode() {
    this.children = new QuadTreeNode[4];
    for (int i = 0; i < 4; i++) {
      this.children[i] = null;
    }
    this.segments = new Segment[4];
    for (int j = 0; j < 4; j++) {
      this.segments[j] = null;
    }
    this.R = null;
  }
  
  //Parameterised Constructor
  public QuadTreeNode()  {
    
  } 
}

/**
 * QuadTree:
 */
public class QuadTree {
  public QuadTreeNode root;
  
  public QuadTree() {

  }
  
  public void insert(Segment s)   {

  }

  /**
   * insert(segment s ,node v) { // Inserting a segment s into an existing node v
   * of QT // v might or might not be a leaf If v is NULL - Error If R(v) is
   * disjoint from x – Return. Else If v is not a leaf, then for each child u of
   * v, call insert(s,u); Else // v is a leaf Add s to v.SegmentsList If number of
   * segments in v.SegmentsList too long (e.g. >5) Call Split(v) }
   * ------------------------------------------------------------------------------
   */
  public void insert(Segment s, QuadTreeNode n) {

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
