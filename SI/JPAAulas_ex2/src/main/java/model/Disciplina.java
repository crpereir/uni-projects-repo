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
import java.util.List;
import java.util.Set;


/**
 * The persistent class for the disciplinas database table.
 * 
 */
@Entity
@Table(name="disciplinas")
@NamedQuery(name="Disciplina.findAll", query="SELECT d FROM Disciplina d")
public class Disciplina  {
	

	@Id
	private String coddisc;

	@Basic(fetch=FetchType.LAZY,optional=false)
	private String descrdisc;

	//bi-directional many-to-one association to Inscr
	@OneToMany(mappedBy="disciplina")
	private List<Inscr> inscrs;


	@ManyToMany(mappedBy="disciplinas",cascade=CascadeType.REMOVE)
	private Set<Professor> professores;
	
	
	
	public Disciplina() {
	}

	public String getCoddisc() {
		return this.coddisc;
	}

	public void setCoddisc(String coddisc) {
		this.coddisc = coddisc;
	}

	public String getDescrdisc() {
		return this.descrdisc;
	}

	public void setDescrdisc(String descrdisc) {
		this.descrdisc = descrdisc;
	}

	public List<Inscr> getInscrs() {
		return this.inscrs;
	}

	public void setInscrs(List<Inscr> inscrs) {
		this.inscrs = inscrs;
	}

	public Inscr addInscr(Inscr inscr) {
		getInscrs().add(inscr);
		inscr.setDisciplina(this);
		return inscr;
	}

	public Inscr removeInscr(Inscr inscr) {
		getInscrs().remove(inscr);
		inscr.setDisciplina(null);

		return inscr;
	}
	
	public void setProfessores(Set<Professor> lp) {
		professores = lp;
	}
	
	public Set<Professor> getProfessores() {
		return this.professores;
	}
	
	public void addProf(Professor p) {
		this.professores.add(p);
	}
	
	public void remDisc(Professor p) {
		this.professores.remove(p);
	}
	

}