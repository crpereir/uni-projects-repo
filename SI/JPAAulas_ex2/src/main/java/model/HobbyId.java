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
 * The primary key class for the hobbies database table.
 * 
 */

// ESTE CÓDIGO NÃO ESTÁ A SER USADO
//
//public class HobbyId {
//
//
//	private Long numal;
//
//	private Integer numhb;
//
//	public HobbyId() {
//	}
//	
//	public HobbyId(long nal, int hb) {
//		 this.numal = nal;
//		 this.numhb = hb;
//	}
//	
//	public long getNumal() {
//		return this.numal;
//	}
//	public Integer getNumhb() {
//		return this.numhb;
//	}
//	
//	public boolean equals(Object other) {
//		if (this == other) {
//			return true;
//		}
//		if (!(other instanceof HobbyId)) {
//			return false;
//		}
//		HobbyId castOther = (HobbyId)other;
//		return 
//			(this.numal == castOther.numal)
//			&& this.numhb.equals(castOther.numhb);
//	}
//
//	public int hashCode() {
//		final int prime = 31;
//		int hash = 17;
//		hash = hash * prime + ((int) (this.numal ^ (this.numal >>> 32)));
//		hash = hash * prime + this.numhb.hashCode();
//		
//		return hash;
//	}
//}
