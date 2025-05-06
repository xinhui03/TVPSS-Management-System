package service;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import entity.Product;
import java.util.List;

@Service
public class ProductDao_usingHibernate {
	
	@Autowired //spring dependency injection
	 private SessionFactory sessionFactory;
	
	 @Transactional
	 public Product findById(int id) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 return currentSession.get(Product.class, id);
	 }
	 
	 @Transactional
	 public void save(Product product) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 currentSession.saveOrUpdate(product);
	 }
	 
	 @Transactional
	 public void detach(Product product) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 currentSession.evict(product);
	 }
	 
	 @Transactional
	 public void update(int id, Product product) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 // Retrieve the persistent product from the database using the provided id
		 Product existingProduct = currentSession.get(Product.class, (long) id);
		 // Check if the product exists before updating
		 if (existingProduct != null) {
			 // Update the properties of the existing product with the new values
			 existingProduct.setName(product.getName());
			 existingProduct.setPrice(product.getPrice());
			 existingProduct.setQuantity(product.getQuantity());
			 // Save the changes back to the database
			 currentSession.merge(existingProduct);
		 }
	 }
	 
	 @Transactional
	 public void delete(int id) {
		 Session currentSession = sessionFactory.getCurrentSession();
		 
		 // Retrieve the persistent product from the database using the provided id
		 Product productToDelete = currentSession.get(Product.class, (int) id);
		 
		// Check if the product exists before deleting
		 if (productToDelete != null) {
		 // Delete the product from the database
		 currentSession.delete(productToDelete);
		 }
	}
	 
	 @Transactional
	 public List<Product> findAll() {
		 Session currentSession = sessionFactory.getCurrentSession();
		 return currentSession.createQuery("from Product").getResultList();
	 	}
	} //end class