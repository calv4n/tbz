import java.util.Arrays;
import java.util.List;

public class FoldLeftUebung3 {
    static class Point {
        double x;
        double y;

        Point(double x, double y) {
            this.x = x;
            this.y = y;
        }

        @Override
        public String toString() {
            return "(" + x + ", " + y + ")";
        }
    }

    public static void main(String[] args) {
        List<Point> points = Arrays.asList(
            new Point(1, 3),
            new Point(2, 5),
            new Point(4, 8),
            new Point(6, 2)
        );
        Point centroid = points.stream()
                              .reduce(new Point(0, 0),
                                      (acc, p) -> new Point(acc.x + p.x, acc.y + p.y),
                                      (p1, p2) -> new Point(p1.x + p2.x, p1.y + p2.y));
        centroid.x /= points.size();
        centroid.y /= points.size();
        System.out.println(centroid);
    }
}