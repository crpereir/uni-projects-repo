/*
 Walter Vieira (2022-04-22)
 Sistemas de Informa��o - projeto JPAAulas_ex3
 C�digo desenvolvido para iulustra��o dos conceitos sobre acesso a dados, concretizados com base na especifica��o JPA.
 Todos os exemplos foram desenvolvidos com EclipseLinlk (3.1.0-M1), usando o ambientre Eclipse IDE vers�o 2022-03 (4.23.0).
 
N�o existe a pretens�o de que o c�digo estaja completo.

Embora tenha sido colocado um esfor�o significativo na corre��o do c�digo, n�o h� garantias de que ele n�o contenha erros que possam 
acarretar problemas v�rios, em particular, no que respeita � consist�ncia dos dados.  
 
*/

package businessLogic;

import java.sql.CallableStatement;
import java.util.List;
import java.sql.*;

import jakarta.persistence.*;

import model.*;

/**
 * Hello world!
 *
 */

class X {
	   private String x;
	   private String y;
	   
	   public X(String s1, String s2) {
		   this.x = s1;
		   this.y = s2;
	   }
	   public String getx() {return x;}
	   public void setx(String v) {this.x = v;}
	   public String gety() {return y;}
	   public void sety(String v) {this.y = v;}
	  
	   
	}

class Y {
	   private Integer i;
	   private String y;
	   
	   public Y(Integer v) {
		   this.i = v;
	   }
	   public Integer getx() {return i;}
	  
	   public void seti(Integer v) {this.i = v;}
	  
	   
	}


public class BLService 
{

	
	public void teste1() throws Exception
	{
      	// ****************** Teste 1 ****************
    	
    	//dynemic and static queries
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {
//		  System.out.println("Ler infoam��o de uma Aluno espec�fico");
//		  em.getTransaction().begin();
//		  
		  //Toda a informa��o do aluno 111:
		  Aluno a =  em.createQuery("select a from Aluno a where a.numal = 111",Aluno.class).getSingleResult();
    	//� equivalente a:
    	// Aluno a =  (Aluno) em.createQuery("select a from Aluno a where a.numal = 111").getSingleResult();
		  System.out.printf("Aluno numero: %d, nome: %s, cacifo: %s\n",a.getNumal(), a.getNomeal(), a.getCacifo().getDescrcac());
		  
		  //O nome do aluno 111:
		  String s = em.createQuery("select a.nomeal as x from Aluno a where a.numal = 111",String.class).getSingleResult();
		  System.out.printf("Nome do aluno: %s\n", s);
		  
		  //INNER JOIN IMPL�CITO
		  //O nome e a descri��o do cacifo do aluno 111:
		  Object[] values = (Object[]) em.createQuery("select a.nomeal, a.cacifo.descrcac from Aluno a where a.numal = 111").getSingleResult();
		  System.out.printf("Nome do aluno: %s, descri��o do cacifo: %s\n", values[0], values[1]);
		  
		  //INNER JOIN IMPL�CITO
		  //O nome e a descri��o do cacifo do aluno 111 num objeto:
		  X x = em.createQuery("select NEW businessLogic.X(a.nomeal, a.cacifo.descrcac) from Aluno a where a.numal = 111",X.class).getSingleResult();
		  System.out.printf("Nome do aluno: %s, descri��o do cacifo: %s\n", x.getx(), x.gety());
		  
		  
		  //INNER JOIN EXPL�CITO
		  //Os n�meros dos alunos cujo cacifo tem a descri��o �cacifo 1�:
		  List<Long> ln = em.createQuery("SELECT a.numal FROM Aluno a, Cacifo c where c = a.cacifo and c.descrcac = \"cacifo 1\"",Long.class).getResultList();
		 for(Long l: ln) {
			 System.out.printf("x:%d,\n",l);
		 }
		  //ou:
		//INNER JOIN EXPL�CITO
		  ln = em.createQuery("SELECT a.numal FROM Aluno a JOIN a.cacifo c where c.descrcac = \"cacifo 1\"",Long.class).getResultList();
			 for(Long l: ln) {
				 System.out.printf("x:%d,\n",l);
			 }
		  
		  
		//INNER JOIN EXPL�CITO
		  //Os n�meros de todos os alunos com cacifo

		  System.out.printf("Contagem: %d\n",  em.createQuery("SELECT a.numal FROM Aluno a INNER JOIN Cacifo c ON a.cacifo = c",Long.class).getResultList().size());
		  
		 // Produto cartesiano
		  //Os n�meros dos alunos repetidos tantas vezes quantos os cacifos existentes 
		  System.out.printf("Contagem: %d\n",  em.createQuery("SELECT a.numal FROM Aluno a INNER JOIN Cacifo c",Long.class).getResultList().size());
		  //Ou:
		  System.out.printf("Contagem: %d\n",  em.createQuery("SELECT a.numal FROM Aluno a, Cacifo c",Long.class).getResultList().size());

		  
		  //Os nomes dos alunos e as descri��es dos cacifos respetivos ou null: 
  	  List<X> l = em.createQuery("select NEW businessLogic.X(a.nomeal, c.descrcac) from Aluno a LEFT OUTER JOIN Cacifo c ON a.cacifo = c",X.class).getResultList();
		  // d� erro?? List<X> l = em.createQuery("select NEW businessLogic.X(a.nomeal, c.descrcac) from Aluno a LEFT OUTER JOIN a.Cacifo c",X.class).getResultList();
		  for (X v: l) {
			  System.out.printf("x:%s, y:%s\n",v.getx(),v.gety());
		  }
		  

		  //A m�dia dos saldos de todas as contas
		  Double d = em.createQuery("select AVG(c.saldo) from Conta c",Double.class).getSingleResult();
		  System.out.printf("M�dia saldos: %f\n",d);
		  
		  //Os n�meros dos alunos e a respetiva contagem do n�mero de cacifos desde que superiores a 0
		  List<Object[]> lo = em.createQuery("select a.numal, count(c) from Aluno a JOIN a.cacifo c group by a having  count(c) > 0").getResultList();
		  //List<Object[]> lo = em.createQuery("select a.numal, count(c) from Aluno a LEFT JOIN a.cacifo c group by a").getResultList();
		  for (Object o[] : lo) {
			  System.out.printf("Aluno: %d, Num cacifos: %d\n",o[0],o[1]);
		  }
			  
		  
		  a =  em.createQuery("select a from Aluno a where a.numal = :na",Aluno.class).setParameter("na", 111).getSingleResult();
		  System.out.printf("Aluno numero: %d, nome: %s, cacifo: %s\n",a.getNumal(), a.getNomeal(), a.getCacifo().getDescrcac());
		  
	
		  a =  em.createQuery("select a from Aluno a where a.numal = ?2",Aluno.class).setParameter(2, 111).getSingleResult();
		  System.out.printf("Aluno numero: %d, nome: %s, cacifo: %s\n",a.getNumal(), a.getNomeal(), a.getCacifo().getDescrcac());
		  
	
		  a = em.createNamedQuery ("Aluno.findByName",
				  Aluno.class)
				  .setParameter("nome", "ana")
				  .getSingleResult();
		  System.out.printf("Aluno numero: %d, nome: %s\n",a.getNumal(), a.getNomeal());

		  
		  
//		  em.getTransaction().commit();
		  
		  

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


	
	public void teste2() throws Exception
	{
      	// ****************** Teste 2 ****************
    	
    	//fun��o escalar (postgreSql)
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {

    		StoredProcedureQuery q = em.createStoredProcedureQuery("fescalar");

    		q.registerStoredProcedureParameter(1,
    		Integer.class, ParameterMode.IN);

    		q.registerStoredProcedureParameter( 2,
    	    		Integer.class, ParameterMode.OUT);
    		q.setParameter(1, 111);

    		q.execute();
    		System.out.printf("dobro de 111:%d\n",q.getOutputParameterValue(2));
    
    		
	
		  
		  
//		  em.getTransaction().commit();
		  
		  

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
	
	
	
	public void teste3() throws Exception
	{
      	// ****************** Teste 3 ****************
    	
    	//fun��o refcursor (postgreSql)
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {
    	em.getTransaction().begin(); // � necess�rio com refcursor

    		StoredProcedureQuery q = em.createStoredProcedureQuery("frefcursor");

    		q.registerStoredProcedureParameter(1,
    		Integer.class, ParameterMode.IN);

    		q.registerStoredProcedureParameter( 2,
    	    		void.class, ParameterMode.REF_CURSOR);
    		q.setParameter(1, 3);

    		if (q.execute()) {
    			List<Object[]> l = (List<Object[]>) q.getOutputParameterValue(2);
    			for(Object[] x : l) {
    				System.out.printf("valor:%s\n",x[0]);
    			}
    		}
    		

//    		if (q.execute()) {
//    			List<Y> l = (List<Y>) q.getOutputParameterValue(2);
//    			for(Y x : l) {
//    				System.out.printf("valor:%s\n",x.getx());
//    			}
//    		}
//    		
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

	
	public void teste3_v2() throws Exception
	{
      	// ****************** Teste 3 ****************
    	
    	//fun��o refcursor (postgreSql)
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {
    	em.getTransaction().begin(); // � necess�rio com refcursor



    	StoredProcedureQuery q = em.createNamedStoredProcedureQuery("namedRefCursQ");
    	//q.setParameter("p1", 3);
    	q.setParameter(1, 3);
    


    		if (q.execute()) {
    			List<Object[]> l = (List<Object[]>) q.getOutputParameterValue(2);
    			for(Object[] x : l) {
    				System.out.printf("valor:%s\n",x[0]);
    			}
    		}
    		

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

	



	public void teste4() throws Exception
	{
      	// ****************** Teste 4 ****************
    	
    	//fun��o que retorna tabelas (postgresql)
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {
      	//em.getTransaction().begin(); // � necess�rio com refcursor

		StoredProcedureQuery q = em.createStoredProcedureQuery("ftabela");

		q.registerStoredProcedureParameter(1,
		Integer.class, ParameterMode.IN);
//
//		q.registerStoredProcedureParameter( 2,
//	    		void.class, ParameterMode.REF_CURSOR);
		q.setParameter(1, 3);


		q.execute();
		List<Object[]> l = (List<Object[]>) q.getResultList();
		// ver alternativa com @NamedStoredProcedureQuery e @SqlResultSetMapping !!!!!!!!!
		for(Object[] x : l) {
				System.out.printf("valor(a,b)=(%d,%d)\n",(Integer)x[0],(Integer)x[1]);
		}

		
		
		
		//em.getTransaction().commit();
	  
  
		  

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

	
	public void teste5() throws Exception
	{
      	// ****************** Teste 5 ****************
    	
    	//stored procedure (postgresql)
		// s� consegui colocar isto a funcionar sem valores retornados.
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {
      	em.getTransaction().begin(); // � necess�rio com call


    	Query q = em.createNativeQuery("call sp(?1)");
    	//N�o pode ser assim:
		 //Query q = em.createNativeQuery("{call sp(?1)}");

   	    q.setParameter(1, 3333);
		//Parameter<Integer> p = q.getParameter(2,Integer.class);

    	//q.setParameter(2, null);
 //q.getSingleResult();
    	q.executeUpdate();
    	
	//	System.out.printf("Valor de j para i=1:%d\n",q.getParameter(2));
		
		
		
		
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

	public void teste5_v2() throws Exception
	{
		// ****************** Teste 5 ****************

		//stored procedure (postgresql)
		// s� consegui colocar isto a funcionar sem valores retornados.
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
		EntityManager em = emf.createEntityManager();
		try
		{
			StoredProcedureQuery q = em.createStoredProcedureQuery("fsp");

			q.registerStoredProcedureParameter(1,
					Integer.class, ParameterMode.IN);

			q.registerStoredProcedureParameter( 2,
					Integer.class, ParameterMode.OUT);
			q.setParameter(1, 111);

			q.execute();
			System.out.printf("sp(111,v) colocou v = %d\n",q.getOutputParameterValue(2));



	/*		Connection con = em.unwrap(Connection.class);
			org.eclipse.persistence.sessions.Session s = em.unwrap(org.eclipse.persistence.sessions.Session.class);
*/



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


	public void teste5_v3() throws Exception
	{
		// ****************** Teste 5 ****************

		//stored procedure (postgresql)
		// s� consegui colocar isto a funcionar sem valores retornados.
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
		EntityManager em = emf.createEntityManager();
		try
		{

			em.getTransaction().begin(); // Tem de se fazer antes de se obter a conex�o

			Connection cn = em.unwrap(Connection.class);
//			org.eclipse.persistence.sessions.Session s = em.unwrap(org.eclipse.persistence.sessions.Session.class);
			try (CallableStatement f = cn.prepareCall(
					"call sp(?,?)")) {
				f.registerOutParameter(2, Types.INTEGER);
				f.setInt(1, 1);
				f.execute();
				System.out.println("par. out: ="+f.getInt(2));
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
	}
}





