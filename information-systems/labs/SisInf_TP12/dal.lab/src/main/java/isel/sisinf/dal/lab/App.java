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
 * JPA Context, DataMapper & Repository pattern, JPQL, NamedQueries, Functions and Stored Procedures
 *  
 * */

import isel.sisinf.dal.lab.repo.JPAContext;

public class App {
	public static void main(String[] args) throws Exception {

		//Go to IContext definition and then to JPAContext
		try (JPAContext ctx = new JPAContext()) {
			// Simple example of Repository usage. Go to Repository interface.
			ctx.beginTransaction();

			// Country Repository
			// f) implement Country repository
			// g) uncomment tests for Country repository
			// h) Uncomment the next code block
			/* 
			System.out.println(ctx.getCountries().findByKey((long) 1));
			ctx.getCountries().find("SELECT c FROM Country c WHERE c.countryId = ?1", 1)
					.forEach(c -> System.out.println(c));

			*/

			// i) Uncomment the next statement and watch the results. What can you conclude?
			/*
			 * ctx.getCountries().find("SELECT s FROM Student s WHERE s.studentNumber = ?1",
			 * 123)
			 * .forEach(c ->System.out.println(c));
			 */

			// Course Repository
			Course c1 = ctx.getCourses().findByKey((long) 1); // j) Do this command need database access? Why?
			System.out.println(c1);
			ctx.getCourses().find("SELECT c FROM Course c").forEach(c -> System.out.println(c));

			// Student Repository
			System.out.println(ctx.getStudents().findByKey(123));
			ctx.getStudents().find("SELECT s FROM Student s").forEach(s -> System.out.println(s));
			ctx.getStudents().getEnrolledStudents(c1).forEach(c -> System.out.println(c));

			Country c = new Country();
			c.setName("Gerany");

			
			//ctx.getCountries().create(c); //k) what are the design patterns used where? Justify.

			// l) From this point forward, Test with Log level = FINE, with and without the
			// block comments on the begin transaction statement

			/*
			 * ctx.commit();
			 * ctx.beginTransaction();
			 */
			//c.setName("Germany");
			//ctx.getCountries().update(c);

			/*
			 * ctx.commit();
			 * 
			 * ctx.beginTransaction();
			 */
			//ctx.getCountries().delete(c);
			//ctx.commit();

			// m) Do this command need database access? Why?
			//ctx.getCourses().findByKey((long) 1);

			//go to JPAContext
			System.out.println(ctx.rand_fx(1));

			//p) uncomment the code and implement the necessary code to  compile and run
			//ctx.getStudents().fromCountry(1).forEach(c2 -> System.out.println(c2));

			//q)  uncomment the code and implement the necessary code to  compile and run
			//ctx.getStudents().getEnrolledCourses(123).forEach(c2 -> System.out.println(c2));

			//r) Should fx be accessible from context or from repositories? Justify


		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw e;
		}

	}
}
