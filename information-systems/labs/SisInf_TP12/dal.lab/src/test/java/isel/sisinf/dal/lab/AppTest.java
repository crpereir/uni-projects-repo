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

import static org.junit.Assert.assertTrue;


import org.junit.Test;

import isel.sisinf.dal.lab.repo.JPAContext;

/**
 * Unit test for JPAContext
 * Just a simple example...
 */
public class AppTest {
	private JPAContext ctx = new JPAContext();
	
	/* 
	@Test 
	public void CountryRepoExists() {
		assertTrue(ctx.getCountries() != null);
	}

	@Test
	public void CountryFindbyKey() {
		assertTrue(ctx.getCountries().findByKey((long) 1) != null);
	}
*/
	
	@Test
	public void CourseRepoExists() {
		assertTrue(ctx.getCourses() != null);
	} 

	@Test
	public void CourseFindbyKey() {
		assertTrue(ctx.getCourses().findByKey((long) 1) != null);
	}

	@Test
	public void StudentRepoExists() {
		assertTrue(ctx.getStudents() != null);
	}

	@Test
	public void StudentsFindbyKey() {
		assertTrue(ctx.getStudents().findByKey((123)) != null);
	}
	
	//Country Mapper
	/* 
	@Test(expected = jakarta.persistence.NoResultException.class)
	public void CourseMapper() 
	{
		ctx.beginTransaction();
		Country c = new Country();
		c.setName("X");

		ctx.getCountries().create(c);
		ctx.commit();
		long k = c.getCountryId();
		ctx.clear();
		assertTrue(ctx.getCountries().findByKey(k) != null);
		
		
		ctx.beginTransaction();
		c = ctx.getCountries().findByKey(k);
		c.setName("Y");
		ctx.getCountries().update(c);
		ctx.commit();
		ctx.clear();
		assertTrue(ctx.getCountries().findByKey(k).getName().equals("Y"));
		
		ctx.beginTransaction();
		c = ctx.getCountries().findByKey(k);
		
		ctx.getCountries().delete(c);
		ctx.commit();
		ctx.clear();
		
		ctx.getCountries().findByKey(k); //throws jakarta.persistence.NoResultException.class
	    
	}
	*/
}
