import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class MapUndFilterUebung2 {
    public static void main(String[] args) {
        List<String> kurse = Arrays.asList(
            "Programmierung in Scala",
            "Datenbanken",
            "Webentwicklung mit JavaScript",
            "Algorithmen und Datenstrukturen"
        );
        // Alphabetisch sortiert
        List<String> resultAsc = kurse.stream()
                                     .filter(kurs -> kurs.contains("Daten"))
                                     .map(kurs -> kurs.replace(" ", ""))
                                     .sorted()
                                     .collect(Collectors.toList());
        System.out.println("Alphabetisch: " + resultAsc);

        // Umgekehrt alphabetisch sortiert
        List<String> resultDesc = kurse.stream()
                                      .filter(kurs -> kurs.contains("Daten"))
                                      .map(kurs -> kurs.replace(" ", ""))
                                      .sorted((a, b) -> b.compareTo(a))
                                      .collect(Collectors.toList());
        System.out.println("Umgekehrt: " + resultDesc);
    }
}