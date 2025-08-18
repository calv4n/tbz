import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class FlatMapUebung2 {
    static class Person {
        String name;
        List<String> colors;

        Person(String name, List<String> colors) {
            this.name = name;
            this.colors = colors;
        }
    }

    public static void main(String[] args) {
        List<Person> persons = Arrays.asList(
            new Person("Max", Arrays.asList("Blau", "Grün")),
            new Person("Anna", Arrays.asList("Rot")),
            new Person("Julia", Arrays.asList("Gelb", "Blau", "Grün"))
        );
        List<String> uniqueColors = persons.stream()
                                          .flatMap(p -> p.colors.stream())
                                          .distinct()
                                          .collect(Collectors.toList());
        System.out.println(uniqueColors);
    }
}