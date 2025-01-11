package service;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import entity.Customer;
import entity.Teacher;
import entity.Student;
import java.util.List;

@Service
public class StudentDAO_usingHibernate {
	
	@Autowired //spring dependency injection
	 private SessionFactory sessionFactory;
	
	 @Transactional
	 public Student findById(int id) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 return currentSession.get(Student.class, id);
	 }
	 
	 @Transactional
	 public void update(Student student) {
	     Session currentSession = sessionFactory.getCurrentSession();
	     currentSession.update(student); // Update the teacher entity directly
	 }

	 
	 @Transactional
	 public void save(Student student) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 currentSession.saveOrUpdate(student);
	 }
	 
	 @Transactional
	 public void detach(Student student) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 currentSession.evict(student);
	 }
	 
	 @Transactional
	 public void update(int id, Student student) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 // Retrieve the persistent customer from the database using the provided id
		 Student existingStudent = currentSession.get(Student.class, (long) id);
		 // Check if the customer exists before updating
		 if (existingStudent != null) {
			 // Update the properties of the existing customer with the new values
			 existingStudent.setFullName(student.getFullName());
			 existingStudent.setEmail(student.getEmail());
			 existingStudent.setAddress(student.getAddress());
			 existingStudent.setContact(student.getContact());
			 existingStudent.setParentcontact(student.getParentcontact());
			 existingStudent.setStudentid(student.getStudentid());
			 existingStudent.setGrade(student.getGrade());

			 
			 // Save the changes back to the database
			 currentSession.merge(existingStudent);
		 }
	 }
	 
	 @Transactional
	 public void delete(int id) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 
		 // Retrieve the persistent customer from the database using the provided id
		 Student studentToDelete = currentSession.get(Student.class, (int) id);
		 
		// Check if the customer exists before deleting
		 if (studentToDelete != null) {
		 // Delete the customer from the database
		 currentSession.delete(studentToDelete);
		 }
	}

	 
	 
	 @Transactional
	 public List<Student> findAll() {
		 Session currentSession = sessionFactory.getCurrentSession();
		 return currentSession.createQuery("from Student").getResultList();
	 	}
	} //end class