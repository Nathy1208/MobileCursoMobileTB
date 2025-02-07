package Model;

public class Pessoa { //encapsulamemto

    //atributos - privado
    private String nome;
    private String cpf;

    //métodos -  públicos
     // construtor
    public Pessoa(String nome, String cpf) {
        this.nome = nome;
        this.cpf = cpf;
    }

    // Setters and Getters

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    };

    //Exibir Informações
    public void exibirinformacoes (){
        System.out.println("Nome"+ getNome());
        System.out.println("CPF"+getCpf());
    }
    
    
    


}
