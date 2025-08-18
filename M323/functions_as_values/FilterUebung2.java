import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class FilterUebung2 {
    public static void main(String[] args) {
        List<String> names = Arrays.asList("Alice", "Bob", "Charlie", "Diana");
        List<String> longNames = names.stream()
                                     .filter(name -> name.length() > 4)
                                     .collect(Collectors.toList());
        System.out.println(longNames);
    }
}