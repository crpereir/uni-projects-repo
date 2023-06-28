/*
 Walter Vieira (2022-04-22)
 Sistemas de Informação - projeto JPAAulas_ex2
 Código desenvolvido para iulustração dos conceitos sobre acesso a dados, concretizados com base na especificação JPA.
 Todos os exemplos foram desenvolvidos com EclipseLinlk (3.1.0-M1), usando o ambientre Eclipse IDE versão 2022-03 (4.23.0).
 
Não existe a pretensão de que o código estaja completo.

Embora tenha sido colocado um esforço significativo na correção do código, não há garantias de que ele não contenha erros que possam 
acarretar problemas vários, em particular, no que respeita à consistência dos dados.  
 
*/

package model;

import java.io.Serializable;
import jakarta.persistence.*;

import java.util.Collection;
import java.util.Set;


/**
 * The persistent class for the professores database table.
 * 
 */
@Entity
@Table(name="professores")
@NamedQuery(name="Professore.findAll", query="SELECT p FROM Professor p")
public class Professor  {
	private static final long serialVersionUID = 1L;

	@Id
	private long numprof;

	private String nomeprof;

	// do lado que se escolhe para owner:
	@ManyToMany(cascade=CascadeType.REMOVE,fetch = FetchType.LAZY)
	//@ManyToMany(cascade=CascadeType.REMOVE,fetch = FetchType.EAGER)
    @JoinTable(name="ensina",
          joinColumns=@JoinColumn(name="numProf"),
          inverseJoinColumns=@JoinColumn(name="codDisc"))
	private Set<Disciplina> disciplinas;
	
	public Professor() {
	}

	public long getNumprof() {
		return this.numprof;
	}

	public void setNumprof(long numprof) {
		this.numprof = numprof;
	}

	public String getNomeprof() {
		return this.nomeprof;
	}

	public void setNomeprof(String nomeprof) {
		this.nomeprof = nomeprof;
	}

	public void setDisciplinas(Set<Disciplina> d) {
		disciplinas = d;
	}
	
	public Set<Disciplina> getDisciplinas() {
		return this.disciplinas;
	}
	
	public void addDisc(Disciplina d) {
		this.disciplinas.add(d);
	}
	
	public void remDisc(Disciplina d) {
		this.disciplinas.remove(d);
	}
	
}