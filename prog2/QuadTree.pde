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
}
