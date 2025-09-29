package ch.tbz;

public class Scope {

    static int var = 1;

    public static void main(String[] args ) {

        int var = 2;

        System.out.println("Im Main: Scope.var=" + Scope.var);
        System.out.println("Im Main: var=" + var);

        func();

        System.out.println("Im Main: var=" + var);
    }

    // function which runs under main
    public static void func() {

        int var = 3;


        System.out.println("In Func: var=" + var);
    }

}
