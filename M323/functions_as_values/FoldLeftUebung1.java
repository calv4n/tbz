import java.util.Arrays;
import java.util.List;

public class FoldLeftUebung1 {
    public static void main(String[] args) {
        List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);
        int sum = numbers.stream()
                        .reduce(0, (acc, n) -> acc + n);
        System.out.println(sum);
    }
}