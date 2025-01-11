package service;

import entity.CrewApplication;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CrewApplicationDAO_usingHibernate {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public void save(CrewApplication application) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(application);
    }

    @Transactional
    public List<CrewApplication> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from CrewApplication", CrewApplication.class).getResultList();
    }

    @Transactional
    public CrewApplication findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(CrewApplication.class, id);
    }

    @Transactional
    public void approve(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        CrewApplication application = currentSession.get(CrewApplication.class, id);
        if (application != null) {
            application.setApproved(true); // Assuming you have an approved field
            currentSession.update(application);
        }
    }

    @Transactional
    public void reject(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        CrewApplication application = currentSession.get(CrewApplication.class, id);
        if (application != null) {
            application.setRejected(true);
            currentSession.update(application);
        }
    }
    
    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        CrewApplication application = currentSession.get(CrewApplication.class, id);
        if (application != null) {
            currentSession.delete(application);
        }
    }
} 