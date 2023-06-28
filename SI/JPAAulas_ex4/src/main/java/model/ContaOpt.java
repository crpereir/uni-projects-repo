/*
 Walter Vieira (2022-04-22)
 Sistemas de Informação - projeto JPAAulas_ex4
 Código desenvolvido para iulustração dos conceitos sobre acesso a dados, concretizados com base na especificação JPA.
 Todos os exemplos foram desenvolvidos com EclipseLinlk (3.1.0-M1), usando o ambientre Eclipse IDE versão 2022-03 (4.23.0).
 
Não existe a pretensão de que o código estaja completo.

Embora tenha sido colocado um esforço significativo na correção do código, não há garantias de que ele não contenha erros que possam 
acarretar problemas vários, em particular, no que respeita à consistência dos dados.  
 
*/

package model;

import java.io.Serializable;

//import org.eclipse.persistence.annotations.OptimisticLocking;

import org.eclipse.persistence.annotations.OptimisticLocking;
import org.eclipse.persistence.annotations.OptimisticLockingType;

import jakarta.persistence.*;


/**
 * The persistent class for the contas database table.
 * 
 */

@Entity
@Table(name="contasOpt")
//No teste 7, retirar comentários da linha seguinte,
// Nos restantes, comentar
//@OptimisticLocking(cascade=true,type=OptimisticLockingType.CHANGED_COLUMNS)
@NamedQuery(name="ContaOpt.findAll", query="SELECT c FROM Conta c")

public class ContaOpt  {
	@Id
	private long id;
	
	@Version
	@Column(name="vers")
	private int vers;
	
	private double saldo;

	public ContaOpt() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public double getSaldo() {
		return this.saldo;
	}

	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}
	public int getVers() {
		return this.vers;
	}


}