import java.util.Scanner;

public class Hangman {
    static char[] wordToGuess;
    static char[] guessedWord;
    static int incorrectGuesses;

    public static void main(String[] args) {
        startGame();
        createField();
        while (!checkWin() && incorrectGuesses < 6) {
            displayField();
            makeGuess();
        }
        checkWin();
    }

    public static void startGame() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter a word to guess: ");
        String input = sc.nextLine();
        wordToGuess = input.toCharArray();
        guessedWord = new char[wordToGuess.length];
        for (int i = 0; i < wordToGuess.length; i++) {
            guessedWord[i] = '_';
        }
        incorrectGuesses = 0;
    }

    public static void createField() {
        System.out.println("\nHangman Game\n");
        System.out.println("You have 6 incorrect guesses.");
    }

    public static void displayField() {
        System.out.println("Incorrect Guesses: " + incorrectGuesses);
        System.out.println("Current Word: ");
        for (char c : guessedWord) {
            System.out.print(c + " ");
        }
        System.out.println();
    }

    public static void makeGuess() {
        Scanner sc = new Scanner(System.in);
        System.out.println("\nEnter a letter: ");
        char guess = sc.next().charAt(0);
        boolean correctGuess = false;
        for (int i = 0; i < wordToGuess.length; i++) {
            if (wordToGuess[i] == guess) {
                guessedWord[i] = guess;
                correctGuess = true;
            }
        }
        if (!correctGuess) {
            incorrectGuesses++;
        }
    }

    public static boolean checkWin() {
        for (char c : guessedWord) {
            if (c == '_') {
                return false;
            }
        }
        System.out.println("\nCongratulations! You won!");
        return true;
    }
}
