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
 * The primary key class for the inscr database table.
 * 
 */
@Embeddable
public class InscrPK {


	//@Column(insertable=false, updatable=false)
	private long numal;

	//@Column(insertable=false, updatable=false)
	private String coddisc;

	public InscrPK() {
	}
	public long getNumal() {
		return this.numal;
	}
	public void setNumal(long numal) {
		this.numal = numal;
	}
	public String getCoddisc() {
		return this.coddisc;
	}
	public void setCoddisc(String coddisc) {
		this.coddisc = coddisc;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof InscrPK)) {
			return false;
		}
		InscrPK castOther = (InscrPK)other;
		return 
			(this.numal == castOther.numal)
			&& this.coddisc.equals(castOther.coddisc);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + ((int) (this.numal ^ (this.numal >>> 32)));
		hash = hash * prime + this.coddisc.hashCode();
		
		return hash;
	}
}