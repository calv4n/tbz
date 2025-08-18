import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class MapUebung5 {
    public static void main(String[] args) {
        List<String> namen = Arrays.asList("Max Mustermann", "Erika Mustermann");
        List<String> vornamen = namen.stream()
                                    .map(name -> name.split(" ")[0].toUpperCase())
                                    .collect(Collectors.toList());
        System.out.println(vornamen);
    }
}