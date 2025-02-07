import java.util.Scanner;

public class CalculadoraOperacoes {

    // atributos
    double numero1, numero2, resultado;
    String operacao;
    boolean continuar = true;

    // construtores (construtor vazio não precisa digitar, pois mesmo que não esteja
    // escrito ele entende que ainda está lá)
    public CalculadoraOperacoes() {

    }

    // métodos

    // adição
    public double soma(double a, double b) {
        return a + b;
    }

    // subtração
    public double subtracao(double a, double b) {
        return a - b;
    }

    // multiplicação
    public double multi(double a, double b) {
        return a * b;
    }

    // divisão
    public double divisão(double a, double b) {
        return a / b;
    }

    // menu
    public void menu(){
        Scanner sc =  new Scanner(System.in);
        do {
            System.out.println("---Calculadora Simples---");
            System.out.println("---Escolha a Operação:---");
            System.out.println("1.Soma");
            System.out.println("2.subtração");
            System.out.println("3.Multiplicação");
            System.out.println("4.Divisão");
            System.out.println("5.Sair");
            System.out.println("===========");
            operacao =sc.next();

            //tomada de decisão -  condição
            switch (operacao) {
                case "1":
                    System.out.println("Informe o 1º nº");
                    numero1 = sc.nextDouble();
                    System.out.println("Informe o 2º nº");
                    numero2 = sc.nextDouble();
                    resultado =  soma(numero1,numero2);
                    System.out.println("O resultado é"+resultado);
                    break;

                case "2":
                    System.out.println("Informe o 1º nº");
                    numero1 = sc.nextDouble();
                    System.out.println("Informe o 2º nº");
                    numero2 = sc.nextDouble();
                    resultado =  subtracao(numero1,numero2);
                    System.out.println("O resultado é"+resultado);
                    break;

                case "3":
                    System.out.println("Informe o 1º nº");
                    numero1 = sc.nextDouble();
                    System.out.println("Informe o 2º nº");
                    numero2 = sc.nextDouble();
                    resultado =  multi(numero1,numero2);
                    System.out.println("O resultado é"+resultado);

                    break;

                case "4":
                    System.out.println("Informe o 1º nº");
                    numero1 = sc.nextDouble();
                    System.out.println("Informe o 2º nº");
                    numero2 = sc.nextDouble();
                    if (numero2 == 0){
                        System.out.println("Não dividíras por 0");
                    }else{
                        resultado =  divisão(numero1,numero2);
                        System.out.println("O resultado é"+ resultado);
                    }
                    break;

                case "5":
                    continuar = false;
                    System.out.println("Saindo...");
                        
            
                default:
                        System.out.println();
                    break;
            }

            
        }while(continuar);sc.close();
}}
