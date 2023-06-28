/*
 Walter Vieira (2022-04-22)
 Sistemas de Informação - projeto JPAAulas_ex2
 Código desenvolvido para iulustração dos conceitos sobre acesso a dados, concretizados com base na especificação JPA.
 Todos os exemplos foram desenvolvidos com EclipseLinlk (3.1.0-M1), usando o ambientre Eclipse IDE versão 2022-03 (4.23.0).
 
Não existe a pretensão de que o código estaja completo.

Embora tenha sido colocado um esforço significativo na correção do código, não há garantias de que ele não contenha erros que possam 
acarretar problemas vários, em particular, no que respeita à consistência dos dados.  
 
*/

package businessLogic;

import java.util.List;
import java.util.Set;
import java.util.ArrayList;

import jakarta.persistence.*;

import model.*;

/**
 * Hello world!
 *
 */
public class BLService 
{
	public  void teste1() throws Exception
	{
      	// ****************** Teste 1 ****************
    	
    	//Criar um aluno com um cacifo
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {
		  System.out.println("Criar um aluno com um cacifo");
		  em.getTransaction().begin();
		  
		  Aluno a = new Aluno();
		  
		  a.setNumal(555); 
		  a.setNomeal("rui silva"); 
		  Cacifo c = new Cacifo();
		  c.setDescrcac("Cacifo 1"); 
		  a.setCacifo(c); 
		  em.persist(a);
		  //em.persist(c);
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

	public  void teste2() throws Exception
	{
        
     	// ****************** Teste 2 ****************
         // Criar outro aluno com um cacifo já existente
 	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
     EntityManager em = emf.createEntityManager();
     try 
     {
         System.out.println("Criar um outro aluno com um cacifo já existente");
        
         em.getTransaction().begin();
         Cacifo c1 = new Cacifo();
         c1.setDescrcac("Cacifo x");
         em.persist(c1);
         em.getTransaction().commit();
		 em.clear();
         em.getTransaction().begin();
		 c1 = (Cacifo) em.createQuery("select c from Cacifo c where c.descrcac = \"Cacifo x\"").getSingleResult();
		 Aluno a1 = new Aluno();
         a1.setNumal(6667);
         a1.setNomeal("ana ribeiro");
         a1.setCacifo(c1);
         //c1.setAluno(a1); // não deveria ser necessário, mas é É????
         em.persist(a1);
		 //em.persist(c1);  // assim não funciona
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
         /* Assim não funciona.
         em.getTransaction().begin();
         Cacifo c1 = new Cacifo();
         c1.setDescrcac("Cacifo 2");
         em.persist(c1);
         //em.getTransaction().commit();
         //em.getTransaction().begin();
         Aluno a1 = new Aluno();
         a1.setNumal(6667);
         a1.setNomeal("ana ribeiro");
         //a1.setCacifo(c1);
         //c1.setAluno(a1); // não deveria ser necessário, mas é
        // em.persist(a1);
         c1.setAluno(a1);
         em.persist(c1);
         em.getTransaction().commit();
         */

	}

	public  void teste3() throws Exception
	{
     	
    	// ****************** Teste 3 ****************
    	// listar todos os alunos e seus cacifos
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {    	       	
    	Query query = em.createQuery("SELECT a from Aluno a");
        List<Aluno> la = query.getResultList();
        
        for (Aluno  x : la) 
        {
            System.out.printf("%d %s\n", x.getNumal(), x.getNomeal());               
            System.out.printf("----Cacifo: %d\n",x.getCacifo()==null?-1:x.getCacifo().getNumcac());
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
	
	public  void teste4() throws Exception
	{
       	
    	// ************************ Teste 4 *******************
      	//Criar um aluno com vários hobbies
		
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {
    	
		  System.out.println("Criar um aluno com com vários hobbies");
		  em.getTransaction().begin();
		  
		  Aluno a = new Aluno();
		  
		  a.setNumal(555); 
		  a.setNomeal("rui silva");
		  
		  
		  List<Hobby> lh = new ArrayList<Hobby>(); 
		  Hobby h1 = new Hobby();
		  h1.setDescr("hobby 1"); 
		  HobbyPK ch = new HobbyPK(); 
		  //ch.setNumal(555);
		  ch.setNumhb(1); 
		  h1.setId(ch);
		  h1.setAluno(a);
		  Hobby h2 = new Hobby();
		  h2.setDescr("hobby 2");
		  HobbyPK ch2 = new HobbyPK();
		  //ch2.setNumal(555);  // não é necessário
		  ch2.setNumhb(2); 
		  h2.setId(ch2);
		  h2.setAluno(a);
		  lh.add(h1);
		  lh.add(h2);
		  
		  
		  a.setHobbies(lh);
		  
		  em.persist(a); //em.persist(a);
		  
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
  //  	Ou:
    	
//
//		  System.out.println("Criar um aluno com com vários hobbies");
//		  em.getTransaction().begin();
//		  
//		  Aluno a = new Aluno();
//		  
//		  a.setNumal(555); 
//		  a.setNomeal("rui silva");
//		  
//		  
//		  List<Hobby> lh = new ArrayList<Hobby>(); 
//		  Hobby h1 = new Hobby();
//		  h1.setDescr("hobby 1"); 
//		  h1.setNumhb(1);
//		  h1.setAluno(a);
//		  Hobby h2 = new Hobby();
//		  h2.setDescr("hobby 2");
//          h2.setNumhb(2);
//		  h2.setAluno(a);
//		  lh.add(h1);
//		  lh.add(h2);
//		  
//		  
//		  a.setHobbies(lh);
//		  
//		  em.persist(a); //em.persist(a);
//		  
//		  em.getTransaction().commit();
//  }
//    catch(Exception e)
//   {
//   	System.out.println(e.getMessage());
//   	throw e;
//   }
//   finally 
//   {
//   	em.close();
//       emf.close();
//   } 
	}
	
	public  void teste5() throws Exception
	{
       	
    	// *************** Teste 5 *********************************
    	// Averbar um evento a uma inscrição
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {
		  System.out.println("Averbar um evento a uma inscrição");
		  em.getTransaction().begin();
		  
		  InscrPK ch = new InscrPK();
		  ch.setCoddisc("lc");
		  ch.setNumal(111);
		  
		 //Inscr i = new Inscr();
		  //i = em.find(i.getClass(), ch);
		Inscr i;
		i = em.find(Inscr.class, ch);
		  
		  Evento e = new Evento();
		  e.setDescrev("Evento 1");
		  //e.setIdev(1);
		  e.setInscr(i);
		  
		  			  
		  em.persist(e); //em.persist(a);
		  
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
	
	public  void teste6() throws Exception
	{
       	
    	// *************** Teste 6 *********************************
    	// Associar um professor a uma disciplina

	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {
		  System.out.println("Associar um professor a uma disciplina");
		  em.getTransaction().begin();
		  
		  Disciplina d = em.find(Disciplina.class, "sisinf");
		  Professor p = em.find(Professor.class,Long.valueOf(333));
		  
		  p.addDisc(d);
		  //d.addProf(p);
		  em.persist(d); // também podia ser em.persist(d);
		  
		  // A adição tem de ser do lado do owner. Assim não funcionaria:
//		  d.addProf(p);
//		  em.persist(d);
		  
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
	
	
	public  void teste7() throws Exception
	{
      	
    	// *************** Teste 7 *********************************
    	// inscrever um aluno numa disciplina
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {
		  System.out.println("Inscrever um aluno numa disciplina");
		  em.getTransaction().begin();
		  
		 // Disciplina d = em.find(Disciplina.class, "isi");
		  Disciplina d = em.getReference(Disciplina.class, "isi");
		 // Aluno a = em.find(Aluno.class,Long.valueOf(222));
		  Aluno a = em.getReference(Aluno.class,Long.valueOf(222));
		  
		  Inscr i = new Inscr();
		  i.setNota(19);
		  i.setAluno(a);
		  i.setDisciplina(d);  
		  em.persist(i); 
		  //a.addInscr(i);
		  //em.persist(a);
		  
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
	//Ou:

//		  System.out.println("Inscrever um aluno numa disciplina");
//		  em.getTransaction().begin();
//		  
//		  Disciplina d = em.find(Disciplina.class, "isi");
//		  Aluno a = em.find(Aluno.class,Long.valueOf(222));
//		  
//		  Inscr i = new Inscr();
//		  i.setNota(19);
//		  i.setAluno(a);
//		  i.setDisciplina(d);
//		  	  
//		  em.persist(i); 
//		  
//		  em.getTransaction().commit();
//		  
//  }
//    catch(Exception e)
//   {
//   	System.out.println(e.getMessage());
//   	throw e;
//   }
//   finally 
//   {
//   	em.close();
//       emf.close();
//   }        	
    	

	}
	
	public  void teste8() throws Exception
	{
    	// *************** Teste 8 *********************************
    	// Change tracking
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {
		  System.out.println("teste de change tracking");
		  em.getTransaction().begin();
		  

		// Aluno a = em.find(Aluno.class,Long.valueOf(111));
		Aluno a = em.find(Aluno.class,111L);
  
		 a.setNomeal("yyyy");
		 a.getHobbies().clear();
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
	
	public  void teste9() throws Exception
	{
	   	
    	// *************** Teste 9 *********************************
    	// lazy/eager loading (associações)

	Professor p;
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {
		  System.out.println("Lazy/eager loading - associações");
		  em.getTransaction().begin();
		  

			//p = em.find(Professor.class,Long.valueOf(111));
		     p = em.find(Professor.class,111L);
			 //System.out.printf("Tipo de p  %s\n", p.getClass().toString());
			 System.out.printf("tipo de getCoddisc( %s\n",p.getDisciplinas().getClass());
			 
		 //em.detach(p);	 
         for(Disciplina x: p.getDisciplinas())
        	 System.out.printf("DISC: %s\n",x.getCoddisc());
         
    	 //System.out.printf("tipo de getCoddisc( %s\n",p.getDisciplinas().getClass());
    	 
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
	
	public  void teste10() throws Exception
	{
		// *************** Teste 10 *********************************
    	// lazy/eager loading - atributos


	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    { // Não se observa diferença entre lazy loadin ativado e não ativado
    	//(o que está de acordo com a especificação)
		  System.out.println("Lazy/eager loading - atributos");
		  em.getTransaction().begin();
		  

			Disciplina d = em.find(Disciplina.class,"isi");
  
        	System.out.printf("Descr: %s\n",d.getDescrdisc());
         
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
	
	
	public  List<Aluno> findAllStudents() throws Exception
	{
		// *************** Teste 11 *********************************
    	// lazy/eager loading - garantia de carregamento (carregamento a pedido)


	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAExemplo");
    EntityManager em = emf.createEntityManager();
    try 
    {
		  System.out.println("Lazy/eager loading - carregamenbto a pedido");
		  List<Aluno> la = (List<Aluno>) em.createQuery("SELECT a FROM Aluno a").getResultList();
		  List<Hobby> lh;
		int i = 0;
		  for (Aluno a : la) {
			lh = a.getHobbies();
			if (lh != null) {
				System.out.println("Antes do carregamento");
				 lh.size(); // forçar carregamento
				System.out.println("Depois do carregamento");
			}
		  }
		  return la;
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

	public  void teste11() throws Exception
	{
		// *************** Teste 11 *********************************
    	// lazy/eager loading - garantia de carregamento (carregamento a pedido)


		for (Aluno a : findAllStudents()) {
		    System.out.printf("Sudent: %d, with %d hobbies\n", a.getNumal(), a.getHobbies().size());
		}
	}
	
	
}
