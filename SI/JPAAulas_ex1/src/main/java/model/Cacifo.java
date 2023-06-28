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
 * The persistent class for the cacifos database table.
 * 
 */
@Entity
@Table(name="cacifos")
@NamedQuery(name="Cacifo.findAll", query="SELECT c FROM Cacifo c")
public class Cacifo /*implements Serializable*/ {
	//private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer numcac;

	private String descrcac;

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

}