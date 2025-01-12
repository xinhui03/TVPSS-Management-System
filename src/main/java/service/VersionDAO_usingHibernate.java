package service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.query.Query;

import entity.Version;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import org.springframework.web.bind.annotation.PathVariable;
import entity.School;

@Service
public class VersionDAO_usingHibernate {

    @Autowired // Spring dependency injection
    private SessionFactory sessionFactory;

    @Transactional
    public Version findById(int schoolId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(Version.class, schoolId);
    }

    @Transactional
    public void update(Version version) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.update(version);
    }

    @Transactional
    public void save(Version version) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(version);
    }

    @Transactional
    public void detach(Version version) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.evict(version);
    }

    @Transactional
    public void update(int schoolId, Version version) {
        Session currentSession = sessionFactory.getCurrentSession();
        // Retrieve the existing Version
        Version existingVersion = currentSession.get(Version.class, schoolId);
        if (existingVersion != null) {
            // Update properties
            existingVersion.setLogoVerified(version.isLogoVerified());
            existingVersion.setCornerVerified(version.isCornerVerified());
            existingVersion.setRecordVerified(version.isRecordVerified());
            existingVersion.setUploadVerified(version.isUploadVerified());
            existingVersion.setRecordIOVerified(version.isRecordIOVerified());
            existingVersion.setCollabVerified(version.isCollabVerified());
            existingVersion.setTechVerified(version.isTechVerified());
            existingVersion.updateVersion(); // Recalculate the version

            // Save the changes
            currentSession.merge(existingVersion);
        }
    }

    @Transactional
    public List<Version> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Version", Version.class).getResultList();
    }

    public Version findLatestBySchoolId(Long schoolId) {
        Session session = sessionFactory.getCurrentSession();
        try {
            return (Version) session.createQuery(
                "FROM Version v WHERE v.schoolId = :schoolId ORDER BY v.createdAt DESC")
                .setParameter("schoolId", schoolId)
                .setMaxResults(1)
                .uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Version findBySchoolId(int schoolId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Version> query = session.createQuery(
            "FROM Version WHERE schoolId = :schoolId", 
            Version.class
        );
        query.setParameter("schoolId", schoolId);
        return query.uniqueResult();
    }
}