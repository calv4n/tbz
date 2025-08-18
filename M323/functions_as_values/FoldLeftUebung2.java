import java.util.Arrays;
import java.util.List;

public class FoldLeftUebung2 {
    public static void main(String[] args) {
        List<String> strings = Arrays.asList("Hallo", " ", "Welt", "!");
        String result = strings.stream()
                              .reduce("", (acc, s) -> acc + s);
        System.out.println(result);
    }
}