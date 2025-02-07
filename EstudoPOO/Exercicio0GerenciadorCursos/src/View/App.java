package View;

import java.util.Scanner;

import Controller.Cursos;
import Model.Aluno;
import Model.Professor;

public class App {
    public static void main(String[] args) throws Exception {
        //Criar curso e iniciar professor
        Professor professor =  new Professor( 
            "Joshiane de Almeida",
            "123.456.789.01",
            1500.00);

        Cursos curso = new Cursos(
            "Programação Java",
             professor);

        //menu de opções 
        int operacao;
        boolean continuar = true;
        Scanner sc = new Scanner(System.in);
        while (continuar) {
            System.out.println("=====================");
            System.out.println("Escolha o que deseja");
            System.out.println("1.Adicionar Aluno");
            System.out.println("2.Informações do Curso");
            System.out.println("3.Sair");
            System.out.println("==================");
            operacao = sc.nextInt();
            switch (operacao) {
                case 1: //Adicionar Aluno
                    System.out.println("Informe o nome do Aluno");
                    String nomeA = sc.next();
                    System.out.println("Informe o CPF do Aluno");
                    String cpfA = sc.next();
                    System.out.println("Informe o número de matrícula");
                    String matriculaA = sc.next();
                    System.out.println("Informe a nota do Aluno");
                    double notaA = sc.nextDouble();
                    Aluno aluno = new Aluno(nomeA, cpfA, matriculaA, notaA);
                    curso.adicionarAlunos(aluno);
                    System.out.println("Aluno Adicionado com Sucesso:");
                    System.out.println("================================");
                    break;

                case 2: //exibir informações do Curso
                    curso.exibirInformacoesCurso();
                    break;

                case 3: //Sair
                    System.out.println("Saindo");
                    continuar = false;
                    break;
            
                default:
                    System.out.println("Infrome um valor válido!");
                    break;
            }
            
        }
        sc.close();
    }

}        
    
