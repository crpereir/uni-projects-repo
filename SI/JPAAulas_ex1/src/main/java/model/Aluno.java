
/*
 Walter Vieira (2022-04-22)
 Sistemas de Informa��o - projeto JPAAulas_ex1
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
 * The persistent class for the alunos database table.
 * 
 */
@Entity
@Table(name="alunos")
@NamedQuery(name="Aluno.findAll", query="SELECT a FROM Aluno a")
public class Aluno /*implements Serializable*/ {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="numAl")
	private long numal;

	@Column(name="nomeAl")
	private String nomeal;

	public Aluno() {
	}

	//@Id
	public long getNumal() {
		return this.numal;
	}

	public void setNumal(long numal) {
		this.numal = numal;
	}

	public String getNomeal() {
		return this.nomeal;
	}

	public void setNomeal(String nomeal) {
		this.nomeal = nomeal;
	}

}