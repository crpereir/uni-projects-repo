/*
 Walter Vieira (2022-04-22)
 Sistemas de Informação - projeto JPAAulas_ex4
 Código desenvolvido para iulustração dos conceitos sobre acesso a dados, concretizados com base na especificação JPA.
 Todos os exemplos foram desenvolvidos com EclipseLinlk (3.1.0-M1), usando o ambientre Eclipse IDE versão 2022-03 (4.23.0).
 
Não existe a pretensão de que o código estaja completo.

Embora tenha sido colocado um esforço significativo na correção do código, não há garantias de que ele não contenha erros que possam 
acarretar problemas vários, em particular, no que respeita à consistência dos dados.  
 
*/

package BusinessLogic;

import java.util.List;
import java.util.Scanner;
import java.util.Set;
import java.util.ArrayList;

import jakarta.persistence.*;
import org.eclipse.persistence.annotations.OptimisticLocking;
import org.eclipse.persistence.annotations.OptimisticLockingType;


import model.*;

/**
 * Hello world!
 *
 */

 class BankAppExc extends Exception {
	  public BankAppExc(String msg) { super(msg); }
	}	
 
public class BLService 
{

	
	public  void teste1() throws Exception
	{
      	// ****************** Teste 1 ****************
    	
  
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();

    try 
    {


	  Conta c = em.find(Conta.class, Long.valueOf(1111));
	  //acquire unit of work
	//Connection acquired from connection pool
	// SELECT ID, SALDO FROM contas WHERE (ID = ?)	bind => [1111]
	 //Connection released to connection pool

  }
    catch(Exception e)
   {
   	System.out.println(e.getMessage());
   	throw e;
   }
   finally 
   {
	 
   	em.close();
    //release unit of work
    emf.close();
	//disconnect
   }   
 }


	
	public  void teste2() throws Exception
	{
      	// ****************** Teste 2 ****************
    	
    	//Verificar iníocio e fim de transações na BD
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    //Connected: jdbc:postgresql://localhost:5432/SisIn (preencher pool)
    //Connection acquired from connection pool [default].
    //Connection released to connection pool [default].
    try 
    {

      em.getTransaction().begin();
      //acquire unit of work
  	  //Conta a = em.find(Conta.class, Long.valueOf(1111),LockModeType.PESSIMISTIC_WRITE);
      Conta c = em.find(Conta.class, Long.valueOf(1111));
	//Connection acquired from connection pool
	// SELECT ID, SALDO FROM contas WHERE (ID = ?)	bind => [1111]
	 //Connection released to connection pool
  	  c.setSaldo(c.getSaldo()+100);;
  	  em.getTransaction().commit();
  	 //begin unit of work commit
  	//Connection acquired from connection pool
  	//begin transaction
  	//UPDATE contas SET SALDO = ? WHERE (ID = ?)  bind => [1100.0, 1111]
  	//commit transaction	  
  	//Connection released to connection pool
  	// end unit of work commit

  }
    catch(Exception e)
   {
   	System.out.println(e.getMessage());
   	throw e;
   }
   finally 
   {
   	em.close();
    emf.close();
   }   
 }
	
	
	public  void teste3() throws Exception
	{
      	// ****************** Teste 3 ****************
    	
    	//Verificar iníocio e fim de transações na BD
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    //Connected: jdbc:postgresql://localhost:5432/SisIn (preencher pool)
    //Connection acquired from connection pool [default].
    //Connection released to connection pool [default].
    try 
    {
      em.getTransaction().begin();
  	  em.flush();
      
      //acquire unit of work
  	  //Conta a = em.find(Conta.class, Long.valueOf(1111),LockModeType.PESSIMISTIC_WRITE);
      Conta c = em.find(Conta.class, Long.valueOf(1111));
	//Connection acquired from connection pool
	// SELECT ID, SALDO FROM contas WHERE (ID = ?)	bind => [1111]
	 //Connection released to connection pool
  	  c.setSaldo(c.getSaldo()+100);;
  	  em.flush();
  	 //begin unit of work flush
  	//Connection acquired from connection pool
  	//begin transaction
  	//UPDATE contas SET SALDO = ? WHERE (ID = ?)  bind => [1100.0, 1111] 
  	//Connection released to connection pool
  	// end unit of work flush
//   	 Conta c1 = em.find(Conta.class, Long.valueOf(2222));
    em.getTransaction().commit();
  }
    catch(Exception e)
   {
   	System.out.println(e.getMessage());
   	throw e;
   }
   finally 
   {
   	em.close();
    emf.close();
   }   
 }
		
	

	public  void teste4() throws Exception
	{
      	// ****************** Teste 4 ****************
    	
    	//Verificar problemas de conssistência
		// Na bd iniciar o saldo da conta 1111 com 1000€
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();

    try 
    {
      em.getTransaction().begin();

      Conta c = em.find(Conta.class, Long.valueOf(1111));

     // No pgadmin4 executar update contas set saldo = saldo - 600 where id = 1111 and saldo >= 600

      if (c.getSaldo() >= 400) {
    	  c.setSaldo(c.getSaldo()-400);
          em.getTransaction().commit();
      }
  }
    catch(Exception e)
   {
   	System.out.println(e.getMessage());
   	throw e;
   }
   finally 
   {
   	em.close();
    emf.close();
   }   
    // verificxar saldo da conta 1111 ma BD
 }
	
	
	

	

	public  void teste5() throws Exception
	{
      	// ****************** Teste 5 ****************
    	
    	//Controlo de concorrência pessimista
		// Na bd iuniciar o saldo da conta 1111 com 1000€
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();

    try 
    {
      em.getTransaction().begin();

      Conta c = em.find(Conta.class, Long.valueOf(1111),LockModeType.PESSIMISTIC_READ);
//      Connection acquired from connection pool 
//      begin transaction
//      SELECT ID, SALDO FROM contas WHERE (ID = ?) FOR UPDATE
//  	bind => [1111]
      
      Conta c1 = em.find(Conta.class, Long.valueOf(2222),LockModeType.PESSIMISTIC_WRITE);
     
      // No pgadmin4 executar update contas set saldo = saldo - 600 where id = 1111 and saldo >= 600

      if (c.getSaldo() >= 400) {
    	  c.setSaldo(c.getSaldo()-400);
          em.getTransaction().commit();
      }
  }
    catch(Exception e)
   {
   	System.out.println(e.getMessage());
   	throw e;
   }
   finally 
   {
   	em.close();
    emf.close();
   }   
    // verificxar saldo da conta 1111 ma BD
 }	
	
	

	public  void teste6() throws Exception
	{
      	// ****************** Teste 6 ****************
    	
    	//Controlo de concorrência otimista
		// Para ser usado com @OptimisticLocking(cascade=true,type=OptimisticLockingType.CHANGED_COLUMNS) comentado em ContaOpt.java
		// 
		// Na bd iuniciar o saldo da conta 1111 com 1000€
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();

    try 
    {
      em.getTransaction().begin();
/*
 Para testar o valor inicial colocada pelo JPA
ContaOpt cx = new ContaOpt();
cx.setId(9999);
cx.setSaldo(90009);
em.persist(cx);*/
      ContaOpt c = em.find(ContaOpt.class, Long.valueOf(1111),LockModeType.OPTIMISTIC);
//      Connection acquired from connection pool 
//      begin transaction
//      SELECT ID, SALDO, vers FROM contasOpt WHERE (ID = ?)
//  	bind => [1111]
//      Connection released to connection pool 
      
 
      // No pgadmin4 executar update contasOpt set saldo = saldo - 600 where id = 1111 and saldo >= 600

      if (c.getSaldo() >= 400) {
    	  c.setSaldo(c.getSaldo()-400);
          em.getTransaction().commit();
          //begin transaction
          //UPDATE contasOpt SET SALDO = ?, vers = ? WHERE ((ID = ?) AND (vers = ?)) bind =>[600.0, 1, 1111, 0]
          //org.eclipse.persistence.exceptions.OptimisticLockException
          //cannot be updated because it has changed or been deleted since it was last read. 
          //Class> model.ContaOpt Primary Key> 1 111
      }
  }
    catch(Exception e)
   {
   	System.out.println(e.getMessage());
   	throw e;
   }
   finally 
   {
   	em.close();
    emf.close();
   }   
    // verificxar saldo da conta 1111 ma BD
 }	
	

	public  void teste7() throws Exception
	{
      	// ****************** Teste 7 ****************
    	
    	//Controlo de concorrência otimista
		// Para ser usado com @OptimisticLocking(cascade=true,type=OptimisticLockingType.CHANGED_COLUMNS) descomentado em ContaOpt.java
		// 
		// Na bd iuniciar o saldo da conta 1111 com 1000€
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();

    try 
    {
      em.getTransaction().begin();

      ContaOpt c = em.find(ContaOpt.class, Long.valueOf(1111));
//      Connection acquired from connection pool 
//      begin transaction
//      SELECT ID, SALDO, vers FROM contasOpt WHERE (ID = ?)
//  	bind => [1111]
//      Connection released to connection pool 
      
 
      // No pgadmin4 executar update contas set saldo = saldo - 600 where id = 1111 and saldo >= 600

      if (c.getSaldo() >= 400) {
    	  c.setSaldo(c.getSaldo()-400);
          em.getTransaction().commit();
          //begin transaction
          //UPDATE contasOpt SET SALDO = ?, vers = ? WHERE ((ID = ?) AND (vers = ?)) bind =>[600.0, 1, 1111, 0]
          //org.eclipse.persistence.exceptions.OptimisticLockException
          //cannot be updated because it has changed or been deleted since it was last read. 
          //Class> model.ContaOpt Primary Key> 1 111
      }
  }
    catch(Exception e)
   {
   	System.out.println(e.getMessage());
   	throw e;
   }
   finally 
   {
   	em.close();
    emf.close();
   }   
    // verificxar saldo da conta 1111 ma BD
 }	
	
			
	public  void teste8(int nreps) throws Exception
	{
      	// ****************** Teste 8 ****************
    	
    	//Controlo de concorrência otimista - Reconciliação
		// para ser usado com @OptimisticLocking(cascade=true,type=OptimisticLockingType.CHANGED_COLUMNS) comentado
		// em ContaOpt.java
		// Na bd iuniciar o saldo da conta 1111 com 1000€
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();

    ContaOpt c=null;
    ContaOpt ent;
    
     try 
      {
    
    	 do {
    		 try 
    		    {
    		     --nreps;
    		     em.getTransaction().begin();
    		     c = em.find(ContaOpt.class, Long.valueOf(1111),LockModeType.OPTIMISTIC);
    		     if(c==null)
           		     throw new BankAppExc("conta inexistente");
     		
    		     if (c.getSaldo() >= 400) {
    		    	  c.setSaldo(c.getSaldo()-400);
    		    	  // experimentar com flush e com commit
    		    	  //em.flush();
    		    	  em.getTransaction().commit(); 		      
    		      }
    		     nreps = 0;
    		    }

 		    catch (RollbackException|OptimisticLockException e) {
		    	if(e.getCause() instanceof OptimisticLockException || e instanceof OptimisticLockException) {
		    		if (em.getTransaction().isActive())
		    	        em.getTransaction().rollback();
		    	   if(nreps == 0) 
    		    	    throw new BankAppExc("erro de concorrência");
		       }   
		      else throw e;
		    }
// 		    catch (RollbackException|OptimisticLockException e) {
//		    	if(e.getCause() instanceof OptimisticLockException || e instanceof OptimisticLockException) {
//		    		if(e instanceof OptimisticLockException) //nesta 
//		    			ent =  (ContaOpt)((OptimisticLockException) e).getEntity(); // devolve null
//		    		else 
//		    			ent=(ContaOpt)((OptimisticLockException) e.getCause()).getEntity(); // devolve null
//		    		System.out.printf("Erro de concorrência com a conta: %d\n",ent.getId());
//		    		if (em.getTransaction().isActive())  
//		    	        em.getTransaction().rollback();
//		    	   if(nreps == 0) 
//    		    	    throw new BankAppExc("erro de concorrência");
//		       }   
//		      else throw e;
//		    }
    	 } while(nreps > 0);
      }
     catch(Exception e)
     {
     	System.out.println(e.getMessage());
     	throw e;
     }
     finally 
     {
      em.close();
      emf.close();
     } 

	}

 }	
	
	



