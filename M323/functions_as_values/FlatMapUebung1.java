import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class FlatMapUebung1 {
    public static void main(String[] args) {
        List<List<Integer>> numbers = Arrays.asList(
            Arrays.asList(1, 2),
            Arrays.asList(3, 4),
            Arrays.asList(5, 6)
        );
        List<Integer> doubled = numbers.stream()
                                      .flatMap(list -> list.stream().map(n -> n * 2))
                                      .collect(Collectors.toList());
        System.out.println(doubled);
    }
}