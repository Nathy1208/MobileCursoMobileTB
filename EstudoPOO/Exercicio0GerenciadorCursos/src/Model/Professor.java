package Model;

public class Professor extends Pessoa{
    //encapsulamento
    //atributos - privados
    private double salario;

    //Contrutor
    public Professor(String nome, String cpf, double salario) {
        super(nome, cpf);
        this.salario = salario;
    }

    //Getters and Setters
    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    @Override // Polimorfismo (@override) para exibir Informações
    public void exibirinformacoes(){
        super.exibirinformacoes();
        System.out.println("Salário R$: "+getSalario());
    }

    
    

}
