/*
 Walter Vieira (2022-04-22)
 Sistemas de Informa��o - projeto JPAAulas_ex3
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
 * The persistent class for the alunos database table.
 * 
 */
@Entity
@NamedStoredProcedureQuery(
	    name = "namedRefCursQ", 
	    procedureName = "frefcursor",
	    parameters = { 
	        @StoredProcedureParameter(mode = ParameterMode.IN, type = Integer.class),//, name = "p1"), 
	        @StoredProcedureParameter(mode = ParameterMode.REF_CURSOR, type = void.class)//, name = "p2")
	    }
	)
 class DummyForNamedSPQuery   {
	@Id
	private int dummy;
}