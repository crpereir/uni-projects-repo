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
 * The persistent class for the cacifos database table.
 * 
 */
@Entity
@Table(name="cacifos")
@NamedQuery(name="Cacifo.findAll", query="SELECT c FROM Cacifo c")
public class Cacifo {


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer numcac;

	private String descrcac;

	//one-to-one association to Aluno
	//@OneToOne //(cascade=CascadeType.PERSIST)
	//@JoinColumn(name="aluga_al")
	@OneToOne(mappedBy="cacifo") //, cascade=CascadeType.PERSIST)
	private Aluno aluno;

	public Cacifo() {
	}

	public Integer getNumcac() {
		return this.numcac;
	}

	public void setNumcac(Integer numcac) {
		this.numcac = numcac;
	}

	public String getDescrcac() {
		return this.descrcac;
	}

	public void setDescrcac(String descrcac) {
		this.descrcac = descrcac;
	}

	public Aluno getAluno() {
		return this.aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}

}