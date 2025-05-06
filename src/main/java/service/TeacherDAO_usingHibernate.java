package service;
import org.hibernate.Session;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import entity.Equipment;
import entity.SchoolInfo;
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
	 public SchoolInfo findBySchoolId(int id) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 return currentSession.get(SchoolInfo.class, id);
	 }
	 
	 @Transactional
	 public Equipment findByEquipId(int id) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 return currentSession.get(Equipment.class, id);
	 }
	 
	 @Transactional
	 public void updateSchoolInfo(SchoolInfo school) {
	     Session currentSession = sessionFactory.getCurrentSession();
	     currentSession.update(school); // Update the teacher entity directly
	 }
	 
	 @Transactional
	 public void update(Teacher teacher) {
	     Session currentSession = sessionFactory.getCurrentSession();
	     currentSession.update(teacher); // Update the teacher entity directly
	 }
	 
	 @Transactional
	 public void updateEquip(Equipment equip) {
	     Session currentSession = sessionFactory.getCurrentSession();
	     currentSession.update(equip); // Update the equip entity directly
	 }

	 
	 @Transactional
	 public void saveSchoolInfo(SchoolInfo school) {
	     Session currentSession = sessionFactory.getCurrentSession();
	     currentSession.saveOrUpdate(school); // Save or update school information
	 }
	 
	 @Transactional
	 public void saveEquipInfo(Equipment equip) {
	     Session currentSession = sessionFactory.getCurrentSession();
	     currentSession.saveOrUpdate(equip); // Save or update model equipment
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
	 public void detach(SchoolInfo school) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 currentSession.evict(school);
	 }
	 
	 @Transactional
	 public void detach(Equipment equip) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 currentSession.evict(equip);
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
	 public void updateSchoolInfo(int id, SchoolInfo schoolInfo) {
	     Session currentSession = sessionFactory.getCurrentSession();
	     // Retrieve the persistent SchoolInfo from the database using the provided id
	     SchoolInfo existingSchool = currentSession.get(SchoolInfo.class, (long) id);
	     
	     // Check if the SchoolInfo exists before updating
	     if (existingSchool != null) {
	         // Update the properties of the existing SchoolInfo with the new values
	         existingSchool.setSchoolName(schoolInfo.getSchoolName());
	         existingSchool.setAddressI(schoolInfo.getAddressI());
	         existingSchool.setAddressII(schoolInfo.getAddressII());
	         existingSchool.setPhoneNo(schoolInfo.getPhoneNo());
	         existingSchool.setEmail(schoolInfo.getEmail());
	         existingSchool.setPostcode(schoolInfo.getPostcode());
	         existingSchool.setState(schoolInfo.getState());
	         existingSchool.setFaxNo(schoolInfo.getFaxNo());
	         existingSchool.setSchoolLogo(schoolInfo.getSchoolLogo());
	         existingSchool.setVideoLink(schoolInfo.getVideoLink());

	         // Save the changes back to the database
	         currentSession.merge(existingSchool);
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
	 public void deleteEquip(int id) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 
		 // Retrieve the persistent equip from the database using the provided id
		 Equipment equipToDelete = currentSession.get(Equipment.class, (int) id);
		 
		// Check if the equip exists before deleting
		 if (equipToDelete != null) {
		 // Delete the customer from the database
		 currentSession.delete(equipToDelete);
		 }
	}
	 
	 @Transactional
	 public List<Teacher> findAll() {
		 Session currentSession = sessionFactory.getCurrentSession();
		 return currentSession.createQuery("from Teacher").getResultList();
	 }
	 
	 @Transactional
	 public List<SchoolInfo> findAllInfo() {
		 Session currentSession = sessionFactory.getCurrentSession();
		 return currentSession.createQuery("from SchoolInfo", SchoolInfo.class).getResultList();
	 }
	 
	 @Transactional
	 public List<Equipment> findAllEquipInfo() {
		 Session currentSession = sessionFactory.getCurrentSession();
		 return currentSession.createQuery("from Equipment", Equipment.class).getResultList();
	 }
} //end class