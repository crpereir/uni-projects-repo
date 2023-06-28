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
 * The persistent class for the hobbies database table.
 * 
 */


@Entity
@Table(name="hobbies")
@NamedQuery(name="Hobby.findAll", query="SELECT h FROM Hobby h")
public class Hobby  {
	

	@EmbeddedId
	private HobbyPK id;

	//bi-directional many-to-one association to Aluno
    @MapsId("numal")  // pode tirar-se se se colocar @Column(insertable=false, updatable=false) em HobbyPK
	@ManyToOne
	@JoinColumn(name="numAl", referencedColumnName="numAl") //,insertable=false, updatable=false)
	private Aluno aluno;
	
	private String descr;

	public Hobby() {
	}

	public HobbyPK getId() {
		return this.id;
	}

	public void setId(HobbyPK id) {
		this.id = id;
	}

	public String getDescr() {
		return this.descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public Aluno getAluno() {
		return this.aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}
}

//Ou:
	// N�o sei porque n�o est� a funcionar
//@Entity
//@Table(name="hobbies")
//@NamedQuery(name="Hobby.findAll", query="SELECT h FROM Hobby h")
//@IdClass(HobbyId.class)
//public class Hobby  {
//	
//	@Id
////	@ManyToOne
////	@JoinColumn(name="numAl", referencedColumnName="numAl") //,insertable=false, updatable=false)
////	private Aluno aluno;
//	private Long numAl;
//	@Id
//	private Integer numhb;
//
//	
//	
//	private String descr;
//
//	public Hobby() {
//	}
//
//
//	public Integer getNumhb() {
//		return this.numhb;
//	}
//	public void setNumhb(Integer numhb) {
//		this.numhb = numhb;
//	}
//
//	public String getDescr() {
//		return this.descr;
//	}
//
//	public void setDescr(String descr) {
//		this.descr = descr;
//	}
//	public void setAluno(Aluno a) {
//		this.numAl = a.getNumal();
//	}
//	
//
//

