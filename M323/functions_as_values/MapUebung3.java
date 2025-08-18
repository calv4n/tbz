import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class MapUebung3 {
    public static void main(String[] args) {
        List<Integer> numbers = Arrays.asList(12, 45, 68, 100);
        List<Double> halved = numbers.stream()
                                     .map(n -> n / 2.0)
                                     .collect(Collectors.toList());
        System.out.println(halved);
    }
}