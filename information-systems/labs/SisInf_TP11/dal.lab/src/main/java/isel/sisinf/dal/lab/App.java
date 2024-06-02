/*
MIT License

Copyright (c) 2022-2024, Nuno Datia, ISEL

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
package isel.sisinf.dal.lab;
/**
 * 
 * Didactic material to support 
 * the Information Systems course
 *
 * The examples may not be complete and/or totally correct.
 * They are made available for teaching purposes and 
 * Any inaccuracies are the subject of discussion in classes.
 *
 *
 *  Application-managed Entity Manager, com Local Transaction
 *  
 * */
import java.util.List;
import jakarta.persistence.*;


public class App 
{
    @SuppressWarnings("unchecked")
	public static void main( String[] args )
    {
        //a) What dal-lab means? How this relate to persistence?
    	EntityManagerFactory emf = Persistence.createEntityManagerFactory("dal-lab");
        EntityManager em = emf.createEntityManager();
        try 
        {
        	//CREATE
            System.out.println("--# CREATE Student");
            em.getTransaction().begin();

            Country cn = new Country();
            cn.setName("France");
            
            
            Student st = new Student(456,"Chiquinho", new java.util.Date(),'M',cn);
            System.out.println(st); // b) check ID of homeCountry. Do it seems OK to you?
            
            //c) Comment and uncomment the following line. Do you notice any difference? What the persist method does?
            //em.persist(cn); 
            
                
            /* d) Run also with this block uncommented. check the IDs on the marked places? Can you see the differences? Explain what flush method does.
            System.out.println(cn); //check ID of homeCountry
            em.flush();
            System.out.println(cn); //check ID of homeCountry
            */

            em.persist(st);
            
            em.getTransaction().commit();
            System.out.println(st); //check ID of homeCountry
            
            
            System.out.println("\n--# Insert succeeded Done!");
            
            //DELETE
            //e) Uncomment the following block of code, solve any problem and see the output. Why method find needs to have two parameters? Can you establish a relationship with the design patterns talked in classes? 
            /*
            System.out.println("\n--# Going to delete...");
            em.getTransaction().begin();
            em.remove(cn);
            em.remove(em.find(Student.class,st.getStudentNumber()));
            em.flush();
            em.getTransaction().commit();
            em.clear();
            System.out.println("\n--# Clean up!!");
            */

            //f) implement the necessary types and made the necessary/sufficient changes to make the next two code blocks work as expected.
            /* 
            //Get student n 123
            st = em.find(Student.class,123);
            System.out.println(st); 
            for(Object c1: st.getCourses())
            {
                System.out.println(c1);
            }
            */
            /*    
            //Get course 1
            Course c = em.find(Course.class,1L);
            System.out.println(st); 
            for(Object st1: c.getStudents())
            {
                System.out.println(st1);
            }
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
}
