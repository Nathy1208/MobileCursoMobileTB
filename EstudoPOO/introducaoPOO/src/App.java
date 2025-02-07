public class App {
   public static void main(String[] args) throws Exception {
//         Pessoas pessoas1 = new Pessoas("Nathaly", "123.456.789-01", "19-12345-6789");
//         System.out.println("Usuário Cadasrado");
//         System.out.println("Nome: "+pessoas1.getNome());
//         System.out.println("Contato"+pessoas1.getContato());
//         pessoas1.setNome("Nathaly Maria");
//         System.out.println(pessoas1.getContato());
    Aluno aluno = new Aluno("José Germano", "123.456.789.01", "19-12345-6789", "Dev", 0);
    aluno.euSouAluno();

    Funcionario funcionario = new Funcionario("Odair", "987.654.321.10", "19-98765-4321", "Professor", "SENAI01");
    funcionario.euSouFuncionario();
        
     }
 }
