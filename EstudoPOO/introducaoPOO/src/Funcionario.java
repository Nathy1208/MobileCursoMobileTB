public class Funcionario extends Pessoas{

    //atributos
    String Cargo;
    String nif;

    //construtor
    public Funcionario(
        String nome, 
        String cpf, 
        String contato,
        String Cargo,
        String nif) {
        super(nome, cpf, contato);
        this.Cargo = Cargo;
        this.nif = nif;
    }

    //métodos
    public String euSouFuncionario() {
        return "Funcionario" +nif;
    }



}
