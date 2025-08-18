import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class MapUebung2 {
    public static void main(String[] args) {
        List<String> names = Arrays.asList("Alice", "Bob", "Charlie");
        List<String> upperCaseNames = names.stream()
                                          .map(String::toUpperCase)
                                          .collect(Collectors.toList());
        System.out.println(upperCaseNames);
    }
}