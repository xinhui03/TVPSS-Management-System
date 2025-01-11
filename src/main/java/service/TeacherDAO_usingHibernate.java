package service;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import entity.Teacher;
import java.util.List;

@Service
public class TeacherDAO_usingHibernate {
	
	@Autowired //spring dependency injection
	 private SessionFactory sessionFactory;
	
	 @Transactional
	 public Teacher findById(int id) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 return currentSession.get(Teacher.class, id);
	 }
	 
	 @Transactional
	 public void update(Teacher teacher) {
	     Session currentSession = sessionFactory.getCurrentSession();
	     currentSession.update(teacher); // Update the teacher entity directly
	 }

	 
	 @Transactional
	 public void save(Teacher teacher) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 currentSession.saveOrUpdate(teacher);
	 }
	 
	 @Transactional
	 public void detach(Teacher teacher) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 currentSession.evict(teacher);
	 }
	 
	 @Transactional
	 public void update(int id, Teacher teacher) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 // Retrieve the persistent customer from the database using the provided id
		 Teacher existingTeacher = currentSession.get(Teacher.class, (long) id);
		 // Check if the customer exists before updating
		 if (existingTeacher != null) {
			 // Update the properties of the existing customer with the new values
			 existingTeacher.setFullName(teacher.getFullName());
			 existingTeacher.setSchoolName(teacher.getSchoolName());
			 existingTeacher.setContactNumber(teacher.getContactNumber());
			 existingTeacher.setEmail(teacher.getEmail());
			 existingTeacher.setState(teacher.getState());
			 existingTeacher.setCity(teacher.getCity());

			 // Save the changes back to the database
			 currentSession.merge(existingTeacher);
		 }
	 }
	 
	 @Transactional
	 public void delete(int id) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 
		 // Retrieve the persistent customer from the database using the provided id
		 Teacher teacherToDelete = currentSession.get(Teacher.class, (int) id);
		 
		// Check if the customer exists before deleting
		 if (teacherToDelete != null) {
		 // Delete the customer from the database
		 currentSession.delete(teacherToDelete);
		 }
	}

	 
	 
	 @Transactional
	 public List<Teacher> findAll() {
		 Session currentSession = sessionFactory.getCurrentSession();
		 return currentSession.createQuery("from Teacher").getResultList();
	 	}
	} //end class