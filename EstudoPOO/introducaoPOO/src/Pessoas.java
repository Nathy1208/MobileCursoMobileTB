public abstract class Pessoas {

    //atributos
    String nome;
    String cpf;
    String contato;

    //construtores
    public Pessoas(String nome, String cpf, String contato) {
        this.nome = nome;
        this.cpf = cpf;
        this.contato = contato;
    }

    //métodos
    // getters - leitura de informação
    public String getNome() {
        return nome;
    }

    public String getCpf() {
        return cpf;
    }

    public String getContato() {
        return contato;
    }

    //setters - alteram a informação
    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setContato(String contato) {
        this.contato = contato;
    }

    
    
    

}
