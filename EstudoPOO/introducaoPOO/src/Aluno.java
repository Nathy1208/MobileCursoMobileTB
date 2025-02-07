public class Aluno extends Pessoas{
    
    //Atributos
    String curso;
    int RM;

    //Construtor

    public Aluno(String nome, String cpf, String contato, String curso, int rM) {
        super(nome, cpf, contato);
        this.curso = curso;
        this.RM= rM;
    }

    //métodos
    public String euSouAluno(){
        return "Aluno "+ RM;
    }
    
}
