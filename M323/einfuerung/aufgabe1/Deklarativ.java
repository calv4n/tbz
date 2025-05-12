public class Deklarativ {
    public static int wordScore(String word) {
        return (int) word.chars()
                .filter(c -> c != 'a')
                .count();
    }

    public static void main(String[] args) {
        System.out.println(wordScore("declarative")); // 9
        System.out.println(wordScore("yes"));         // 3
    }
}