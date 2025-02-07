package Controller;

import java.util.ArrayList;
import java.util.List;
import Model.Aluno;
import Model.Professor;

public class Cursos {
    //Atributos - privados
    private String nomeCurso;
    private Professor professor;
    private List<Aluno> alunos;

    //métodos - públicos
    public Cursos(String nomeCurso, Professor professor) {
        this.nomeCurso = nomeCurso;
        this.professor = professor;
        this.alunos = new ArrayList<>();
    }

    //Adicionar alunos
    public void adicionarAlunos(Aluno aluno) {
        alunos.add(aluno);
    }

    //Exibir informações do curso
    public void exibirInformacoesCurso(){
        System.out.println("Nome do Curso:"+nomeCurso);
        System.out.println("Nome Professor:"+professor.getNome());
        //loop - foreach (para cada)
        int i = 1;
        for (Aluno aluno : alunos) {
            System.out.println(i+"."+aluno.getNome());
            i++;
        }

        //Exibir o status do aluno, se ele está aprovado ou reprovado
        public void exibirStatusAluno() {
            int i = 1;
        for (Aluno aluno : alunos) {
            if (aluno.getNota()=> 6) {
                System.out.println(i +"."+ aluno.getNota()+"| Aprovado");
            } else
            System.out.println(i+"."+ aluno.getNota()+"|Reprovado");
            i++;
        }
        }

    }
}
