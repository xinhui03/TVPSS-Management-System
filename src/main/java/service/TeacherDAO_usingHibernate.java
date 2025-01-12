package service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entity.Teacher;
import entity.School;
import java.util.List;
import java.util.Optional;
import java.util.ArrayList;

@Repository
@Transactional
public class TeacherDAO_usingHibernate {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    public void save(Teacher teacher) {
        try {
            Session session = sessionFactory.getCurrentSession();
            session.save(teacher);
        } catch (Exception e) {
            throw new RuntimeException("Error saving teacher: " + e.getMessage());
        }
    }
    
    public void update(Teacher teacher) {
        try {
            Session session = sessionFactory.getCurrentSession();
            session.update(teacher);
        } catch (Exception e) {
            throw new RuntimeException("Error updating teacher: " + e.getMessage());
        }
    }
    
    public Teacher findById(int id) {
        try {
            Session session = sessionFactory.getCurrentSession();
            return session.get(Teacher.class, id);
        } catch (Exception e) {
            throw new RuntimeException("Error finding teacher by ID: " + e.getMessage());
        }
    }
    
    public List<Teacher> findAll() {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<Teacher> query = session.createQuery("FROM Teacher ORDER BY id", Teacher.class);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error retrieving all teachers: " + e.getMessage());
        }
    }
    
    public void delete(int id) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Teacher teacher = session.get(Teacher.class, id);
            if (teacher != null) {
                session.delete(teacher);
            }
        } catch (Exception e) {
            throw new RuntimeException("Error deleting teacher: " + e.getMessage());
        }
    }
    
    public List<School> getDistinctSchools() {
        System.out.println("DEBUG: Fetching distinct schools");
        try (Session session = sessionFactory.getCurrentSession()) {
            return session.createQuery("SELECT DISTINCT s FROM School s", School.class)
                         .getResultList();
        } catch (Exception e) {
            System.err.println("ERROR in getDistinctSchools: " + e.getMessage());
            return new ArrayList<>();
        }
    }
    
    public Teacher findBySchoolId(Long schoolId) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<Teacher> query = session.createQuery(
                "FROM Teacher t WHERE t.schoolId = :schoolId", 
                Teacher.class
            );
            query.setParameter("schoolId", schoolId);
            return query.uniqueResult();
        } catch (Exception e) {
            throw new RuntimeException("Error finding teacher by school ID: " + e.getMessage());
        }
    }
    
    public List<Teacher> findBySchoolName(String schoolName) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<Teacher> query = session.createQuery(
                "FROM Teacher t WHERE t.schoolName = :schoolName ORDER BY t.id", 
                Teacher.class
            );
            query.setParameter("schoolName", schoolName);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding teachers by school name: " + e.getMessage());
        }
    }
    
    public Optional<Teacher> findByEmail(String email) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<Teacher> query = session.createQuery(
                "FROM Teacher t WHERE t.email = :email", 
                Teacher.class
            );
            query.setParameter("email", email);
            return Optional.ofNullable(query.uniqueResult());
        } catch (Exception e) {
            throw new RuntimeException("Error finding teacher by email: " + e.getMessage());
        }
    }
    
    public boolean existsByEmail(String email) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<Long> query = session.createQuery(
                "SELECT COUNT(t) FROM Teacher t WHERE t.email = :email", 
                Long.class
            );
            query.setParameter("email", email);
            return query.uniqueResult() > 0;
        } catch (Exception e) {
            throw new RuntimeException("Error checking teacher existence by email: " + e.getMessage());
        }
    }
    
    public School findSchoolById(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(School.class, id);
    }
}