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
 * The persistent class for the eventos database table.
 * 
 */
@Entity
@Table(name="eventos")
public class Evento  {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idev;

	private String descrev;

	//bi-directional many-to-one association to Inscr
	@ManyToOne
	@JoinColumns({
		@JoinColumn(name="coddisc", referencedColumnName="coddisc"),
		@JoinColumn(name="numal", referencedColumnName="numal")
		})
	private Inscr inscr;

	public Evento() {
	}

	public Integer getIdev() {
		return this.idev;
	}

	public void setIdev(Integer idev) {
		this.idev = idev;
	}

	public String getDescrev() {
		return this.descrev;
	}

	public void setDescrev(String descrev) {
		this.descrev = descrev;
	}

	public Inscr getInscr() {
		return this.inscr;
	}

	public void setInscr(Inscr inscr) {
		this.inscr = inscr;
	}

}