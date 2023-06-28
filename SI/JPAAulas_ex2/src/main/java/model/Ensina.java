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


/**
 * The persistent class for the ensina database table.
 * 
 */
@Entity
@NamedQuery(name="Ensina.findAll", query="SELECT e FROM Ensina e")
public class Ensina implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private EnsinaPK id;

	//bi-directional many-to-one association to Professore
	@ManyToOne
	@JoinColumn(name="numprof")
	private Professor professor;
	
	@ManyToOne
	@JoinColumn(name="coddisc")
	private Professor disciplina;

	public Ensina() {
	}

	public EnsinaPK getId() {
		return this.id;
	}

	public void setId(EnsinaPK id) {
		this.id = id;
	}

	public Professor getProfessor() {
		return this.professor;
	}

	public void setProfessor(Professor prof) {
		this.professor = prof;
	}

}