package service;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import entity.Customer;
import java.util.List;

@Service
public class CustomerDao_usingHibernate {
	
	@Autowired //spring dependency injection
	 private SessionFactory sessionFactory;
	
	 @Transactional
	 public Customer findById(int id) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 return currentSession.get(Customer.class, id);
	 }
	 
	 @Transactional
	 public void save(Customer customer) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 currentSession.saveOrUpdate(customer);
	 }
	 
	 @Transactional
	 public void detach(Customer customer) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 currentSession.evict(customer);
	 }
	 
	 @Transactional
	 public void update(int id, Customer customer) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 // Retrieve the persistent customer from the database using the provided id
		 Customer existingCustomer = currentSession.get(Customer.class, (long) id);
		 // Check if the customer exists before updating
		 if (existingCustomer != null) {
			 // Update the properties of the existing customer with the new values
			 existingCustomer.setName(customer.getName());
			 existingCustomer.setAddress(customer.getAddress());
			 existingCustomer.setContactNum(customer.getContactNum());
			 existingCustomer.setEmail(customer.getEmail());
			 // Save the changes back to the database
			 currentSession.merge(existingCustomer);
		 }
	 }
	 
	 @Transactional
	 public void delete(int id) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 
		 // Retrieve the persistent customer from the database using the provided id
		 Customer customerToDelete = currentSession.get(Customer.class, (int) id);
		 
		// Check if the customer exists before deleting
		 if (customerToDelete != null) {
		 // Delete the customer from the database
		 currentSession.delete(customerToDelete);
		 }
	}
	 
	 @Transactional
	 public List<Customer> findAll() {
		 Session currentSession = sessionFactory.getCurrentSession();
		 return currentSession.createQuery("from Customer").getResultList();
	 	}
	} //end class