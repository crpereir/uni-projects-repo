/*
 Walter Vieira (2022-04-22)
 Sistemas de Informa��o - projeto JPAAulas_ex2
 C�digo desenvolvido para iulustra��o dos conceitos sobre acesso a dados, concretizados com base na especifica��o JPA.
 Todos os exemplos foram desenvolvidos com EclipseLinlk (3.1.0-M1), usando o ambientre Eclipse IDE vers�o 2022-03 (4.23.0).
 
N�o existe a pretens�o de que o c�digo estaja completo.

Embora tenha sido colocado um esfor�o significativo na corre��o do c�digo, n�o h� garantias de que ele n�o contenha erros que possam 
acarretar problemas v�rios, em particular, no que respeita � consist�ncia dos dados.  
 
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