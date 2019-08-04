// Md Arfan Uddin
// Mayank Gandhi
// CSc 345
// Prog #2
// implementation of Quad Tree Node

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
  private boolean imLeaf;

  // Default Constructor
  public QuadTreeNode(Rectangle rect) {
    nodeSegments = new ArrayList();
    imLeaf = true;
    this.children = new QuadTreeNode[4];
    for (int i = 0; i < 4; i++) {
      this.children[i] = null;
    }
    this.rect = rect;
    rectangles.add(rect);  // bad design, but for now is okay! need to find a perfect place this 
  }
  
  public QuadTreeNode topRight(){ return children[0];}
  public QuadTreeNode topLeft(){ return children[1];}
  public QuadTreeNode bottomRight(){ return children[2];}
  public QuadTreeNode bottomLeft(){ return children[3];}
  
  public void addSegment(Segment seg){nodeSegments.add(seg);}
  
  public ArrayList<Segment> getSegment(){return nodeSegments;}
  
  public void addEmptyChildren(){
    if(children[0] == null) children[0] = new QuadTreeNode(rect.topRight());
    if(children[1] == null) children[1] = new QuadTreeNode(rect.topLeft());
    if(children[2] == null) children[2] = new QuadTreeNode(rect.bottomRight());
    if(children[3] == null) children[3] = new QuadTreeNode(rect.bottomLeft());
  }
  
  public boolean isLeaf() {return imLeaf;}
  public boolean isNode() {return !imLeaf;}
  
  public void makeMeParent(){
    imLeaf = false;
  }
  
  public Rectangle getRect() {return rect;}
  
  public boolean canHave(Segment seg){
    return rect.Are_Intersecting(seg);
  }
  
  public boolean containEndPoint(){
    for(Segment seg: nodeSegments){
      if(rect.inside(seg.getRightPoint())){
        return true;
      }
    }
    return false;
  }
  
  public boolean containEndPoint(Segment seg){
    return rect.inside(seg.getRightPoint());
  }
  
  public String toString(){
    return "segs: " + nodeSegments.toString() + " rect: " + rect.toString();
  }
  
}

/**
 * Quad Tree implementation 
 */
public class QuadTree {
  public QuadTreeNode root;
  int x1, x2, y1, y2, pixel;
  int capacity = 3;
  
  public QuadTree(int x1,int x2, int y1, int y2, int pixel) {
      this.x1 = x1;
      this.x2 = x2;
      this.y1 = y1;
      this.y2 = y2;
      this.pixel = pixel;
      Rectangle rect = new Rectangle(x1, x2, y1, y2);
      root = new QuadTreeNode(rect);
  }
  
  public void insert(Segment seg) {
    insert(root, seg);
  }
  
   private void insert(QuadTreeNode node, Segment seg) {
     Rectangle tempRect = node.rect;
     
     if(tempRect.height() < pixels) return;
     if(!node.canHave(seg)) return;
     
     if(node.isLeaf()){ //<>//
       node.addSegment(seg);
       if(node.getSegment().size() > capacity){
         node.makeMeParent();
         node.addEmptyChildren();
         for(Segment s: node.getSegment()){
           insert(node, s);
         }
       }
     }else{
       for(int i = 0; i < 4; i++){
         insert(node.children[i], seg);
       }
     }
   }
   
   public void query(Rectangle rect) {
    query(root, rect);
  }
  
  private void query(QuadTreeNode node, Rectangle rect) {
     Rectangle tempRect = node.rect;
     
     if(!tempRect.intersects(rect)) return;
     
     tempRect.highlight();
     
     if(node.isLeaf()){
       for(Segment s: node.getSegment()){
         if(rect.Are_Intersecting(s))
           s.highlight();
       }
       
     }else{
       for(int i = 0; i < 4; i++){
         if(rect.intersects(node.children[i].rect)){
           //node.children[i].rect.highlight();
           query(node.children[i], rect);
         }
       }
     }
   }
   
  public void queryEndPoint(Rectangle rect) {
    countEnd = 0;
    queryEndPoint(root, rect);
  }
  
  private void queryEndPoint(QuadTreeNode node, Rectangle rect) {
     Rectangle tempRect = node.rect;
     
     if(!tempRect.intersects(rect)) return;
     
     tempRect.highlight();
     
     if(node.isLeaf()){
       for(Segment s: node.getSegment()){
         if(rect.inside(s.getRightPoint()) && node.containEndPoint(s)){
           countEnd++;
           s.highlight();
         }
       }
       
     }else{
       for(int i = 0; i < 4; i++){
         if(rect.intersects(node.children[i].rect) && node.children[i].containEndPoint()){
           queryEndPoint(node.children[i], rect);
         }
       }
     }
   }
  
}
