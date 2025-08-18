import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class FilterUebung5 {
    static class Buch {
        String titel;
        String autor;
        int jahr;

        Buch(String titel, String autor, int jahr) {
            this.titel = titel;
            this.autor = autor;
            this.jahr = jahr;
        }
    }

    public static void main(String[] args) {
        List<Buch> buecher = Arrays.asList(
            new Buch("1984", "George Orwell", 1949),
            new Buch("Brave New World", "Aldous Huxley", 1932),
            new Buch("Fahrenheit 451", "Ray Bradbury", 1953)
        );
        List<String> titles = buecher.stream()
                                    .filter(buch -> buch.jahr < 1950)
                                    .map(buch -> buch.titel)
                                    .collect(Collectors.toList());
        System.out.println(titles);
    }
}