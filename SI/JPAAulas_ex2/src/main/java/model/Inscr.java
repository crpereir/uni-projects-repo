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
 * The persistent class for the inscr database table.
 * 
 */
@Entity
@NamedQuery(name="Inscr.findAll", query="SELECT i FROM Inscr i")
public class Inscr  {


	@EmbeddedId
	private InscrPK id;

	//bi-directional many-to-one association to Aluno
	@ManyToOne
	@MapsId("numal")
	@JoinColumn(name="numal")
	private Aluno aluno;

	
	//bi-directional many-to-one association to Disciplina
	@ManyToOne
	@MapsId("coddisc")
	@JoinColumn(name="coddisc")
	private Disciplina disciplina;
	
	
	
	//bi-directional many-to-one association to Evento
	@OneToMany(mappedBy="inscr")
	private List<Evento> eventos;
	
	private Integer nota;
	
	public Inscr() {
	}

	public InscrPK getId() {
		return this.id;
	}

	public void setId(InscrPK id) {
		this.id = id;
	}

	public Integer getNota() {
		return this.nota;
	}

	public void setNota(Integer nota) {
		this.nota = nota;
	}

	public List<Evento> getEventos() {
		return this.eventos;
	}

	public void setEventos(List<Evento> eventos) {
		this.eventos = eventos;
	}

	public Evento addEvento(Evento evento) {
		getEventos().add(evento);
		evento.setInscr(this);

		return evento;
	}

	public Evento removeEvento(Evento evento) {
		getEventos().remove(evento);
		evento.setInscr(null);

		return evento;
	}

	public Aluno getAluno() {
		return this.aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}
	
	public Disciplina getDisciplina() {
		return this.disciplina;
	}

	public void setDisciplina(Disciplina disciplina) {
		this.disciplina = disciplina;
	}

}