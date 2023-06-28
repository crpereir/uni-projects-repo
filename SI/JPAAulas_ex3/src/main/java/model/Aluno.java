/*
 Walter Vieira (2022-04-22)
 Sistemas de Informação - projeto JPAAulas_ex3
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
 * The persistent class for the alunos database table.
 * 
 */
@Entity
@Table(name="alunos")
@NamedQuery(name="Aluno.findAll", query="SELECT a FROM Aluno a")
@NamedQuery(name="Aluno.findByName", query="SELECT a FROM Aluno a where a.nomeal = :nome")
public class Aluno implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private long numal;

	private String nomeal;

	//bi-directional many-to-one association to Cacifo
	@ManyToOne
	@JoinColumn(name="aluga_cac")
	private Cacifo cacifo;

	public Aluno() {
	}

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

	public Cacifo getCacifo() {
		return this.cacifo;
	}

	public void setCacifo(Cacifo cacifo) {
		this.cacifo = cacifo;
	}

}