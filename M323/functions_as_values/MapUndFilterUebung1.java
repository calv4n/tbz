import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class MapUndFilterUebung1 {
    static class Mitarbeiter {
        String name;
        String abteilung;
        int gehalt;

        Mitarbeiter(String name, String abteilung, int gehalt) {
            this.name = name;
            this.abteilung = abteilung;
            this.gehalt = gehalt;
        }
    }

    public static void main(String[] args) {
        List<Mitarbeiter> mitarbeiter = Arrays.asList(
            new Mitarbeiter("Max Mustermann", "IT", 50000),
            new Mitarbeiter("Erika Musterfrau", "Marketing", 45000),
            new Mitarbeiter("Klaus Klein", "IT", 55000),
            new Mitarbeiter("Julia Gross", "HR", 40000)
        );
        List<String> result = mitarbeiter.stream()
                                        .filter(m -> m.abteilung.equals("IT") && m.gehalt >= 50000)
                                        .map(m -> m.name.split(" ")[0].toUpperCase())
                                        .collect(Collectors.toList());
        System.out.println(result);
    }
}