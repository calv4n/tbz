public class Imperativ {
    public static int calculateScore(String word) {
        int score = 0;
        for (char c : word.toCharArray()) {
            if (c != 'a') {
                score++;
            }
        }
        return score;
    }

    public static void main(String[] args) {
        System.out.println(calculateScore("imperative")); // 9
        System.out.println(calculateScore("no"));         // 2
    }
}
