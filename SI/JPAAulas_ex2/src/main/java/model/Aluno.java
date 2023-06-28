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

import java.util.List;


/**
 * The persistent class for the alunos database table.
 * 
 */
@Entity
@Table(name="alunos")
@NamedQuery(name="Aluno.findAll", query="SELECT a FROM Aluno a")
public class Aluno  {


	@Id
	private long numal;

	private String nomeal;

	//bi-directional one-to-one association to Cacifo
	//@OneToOne(mappedBy="aluno",cascade=CascadeType.PERSIST)
	@OneToOne(cascade=CascadeType.PERSIST)
	@JoinColumn(name="aluga_cac",unique=true)
	private Cacifo cacifo;
	

	//bi-directional many-to-one association to Hobby
	@OneToMany(mappedBy="aluno",cascade=CascadeType.PERSIST, orphanRemoval=true)
	private List<Hobby> hobbies;

//	//bi-directional many-to-one association to Inscr
//	@OneToMany(mappedBy="aluno")
//	private List<Inscr> inscrs;
	
//	@ManyToMany
//	// @JoinTable tem de se colcar no sítio que se escolhe como owner
//    @JoinTable(name="inscr",
//            joinColumns=@JoinColumn(name="numAl"),
//            inverseJoinColumns=@JoinColumn(name="codDisc"))
//    private List<Inscr> inscrs;
//    
	
	//bi-directional many-to-one association to Hobby
	@OneToMany(mappedBy="aluno",cascade=CascadeType.PERSIST)
	private List<Inscr> inscrs;

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

	public void setCacifo(Cacifo cac) {
		this.cacifo = cac;
	}

	
	public List<Hobby> getHobbies() {
		return this.hobbies;
	}

	public void setHobbies(List<Hobby> hobbies) {
		this.hobbies = hobbies;
	}

	public Hobby addHobby(Hobby hobby) {
		getHobbies().add(hobby);
		hobby.setAluno(this);

		return hobby;
	}

	public Hobby removeHobby(Hobby hobby) {
		getHobbies().remove(hobby);
		hobby.setAluno(null);

		return hobby;
	}

	public List<Inscr> getInscrs() {
		return this.inscrs;
	}

	public void setInscrs(List<Inscr> inscrs) {
		this.inscrs = inscrs;
	}
	public Inscr addInscr(Inscr inscr) {
		getInscrs().add(inscr);
		inscr.setAluno(this);

		return inscr;
	}

	// Para ver melhor
//	public Inscr removeInscr(Inscr inscr) {
//		getInscrs().remove(inscr);
//		inscr.setAluno(null);
//
//		return inscr;
//	}
	

}