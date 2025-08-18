import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class MapUebung4 {
    static class Adresse {
        String strasse;
        int hausnummer;
        String postleitzahl;
        String stadt;

        Adresse(String strasse, int hausnummer, String postleitzahl, String stadt) {
            this.strasse = strasse;
            this.hausnummer = hausnummer;
            this.postleitzahl = postleitzahl;
            this.stadt = stadt;
        }
    }

    public static void main(String[] args) {
        List<Adresse> adressen = Arrays.asList(
            new Adresse("Hauptstrasse", 10, "12345", "Musterstadt"),
            new Adresse("Nebenstrasse", 5, "23456", "Beispielburg")
        );
        List<String> formatted = adressen.stream()
                                        .map(a -> a.strasse + " " + a.hausnummer + ", " + a.postleitzahl + " " + a.stadt)
                                        .collect(Collectors.toList());
        System.out.println(formatted);
    }
}