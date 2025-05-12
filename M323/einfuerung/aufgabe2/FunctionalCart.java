import java.util.List;

public class FunctionalCart {

    public static double getDiscountPercentage(List<String> items) {
        return items.contains("book") ? 5.0 : 0.0;
    }
}
