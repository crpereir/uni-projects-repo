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
	// Não sei porque não está a funcionar
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

