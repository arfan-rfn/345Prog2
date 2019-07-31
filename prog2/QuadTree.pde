public class QuadTreeNode {
    QuadTreeNode[] children;
    Segment[] segments;
    Rectangle R;

    public QuadTreeNode() {
        this.children = new QuadTreeNode[4];
        for (int i = 0; i < max; i++) {
            this.children[i] = null;
        }
        this.segments = new Segment[4];
        for (int j = 0; j < 4; j++) {
            this.segments[j] = null;
        }
    }
}

public class QuadTree {
    public QuadTreeNode root;

}