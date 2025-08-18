import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class FilterUebung3 {
    public static void main(String[] args) {
        List<Integer> numbers = Arrays.asList(12, 45, 68, 100);
        List<Integer> largeNumbers = numbers.stream()
                                           .filter(n -> n > 50)
                                           .collect(Collectors.toList());
        System.out.println(largeNumbers);
    }
}