import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class FilterUebung4 {
    public static void main(String[] args) {
        List<String> words = Arrays.asList("Scala", "ist", "fantastisch");
        List<String> sWords = words.stream()
                                  .filter(word -> word.startsWith("S"))
                                  .collect(Collectors.toList());
        System.out.println(sWords);
    }
}