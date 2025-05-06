package service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;
import entity.Version;
import org.hibernate.transform.Transformers;
import org.hibernate.query.NativeQuery;
import java.util.ArrayList;
import org.hibernate.SQLQuery;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.type.StandardBasicTypes;
import java.util.HashMap;
import java.math.BigInteger;
import org.hibernate.transform.AliasToEntityMapResultTransformer;

@Repository
@Transactional
public class VersionDAO {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    public List<Map<String, Object>> findAllVersionInfo() {
        Session session = sessionFactory.getCurrentSession();
        try {
            String sql = "SELECT " +
                        "id, " +
                        "school_id as schoolId, " +
                        "version_level as versionLevel, " +
                        "has_logo as hasLogo, " +
                        "has_studio as hasStudio, " +
                        "has_recording as hasRecording, " +
                        "has_youtube_upload as hasYoutubeUpload, " +
                        "has_outside_recording as hasOutsideRecording, " +
                        "has_collaboration as hasCollaboration, " +
                        "has_green_screen as hasGreenScreen " +
                        "FROM version " +
                        "ORDER BY school_id";

            NativeQuery<Map<String, Object>> query = session.createNativeQuery(sql);
            query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
            
            List<Map<String, Object>> results = query.getResultList();
            System.out.println("Found " + results.size() + " version records");
            return results;
            
        } catch (Exception e) {
            System.out.println("Error in findAllVersionInfo: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public Version findBySchoolId(Integer schoolId) {
        Session session = sessionFactory.getCurrentSession();
        try {
            String hql = "FROM Version WHERE schoolId = :schoolId";
            return session.createQuery(hql, Version.class)
                         .setParameter("schoolId", schoolId)
                         .uniqueResult();
        } catch (Exception e) {
            System.out.println("Error finding version by schoolId: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public void save(Version version) {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.saveOrUpdate(version);
            System.out.println("Version saved for school: " + version.getSchoolId());
        } catch (Exception e) {
            System.out.println("Error saving version: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }

    public void update(Version version) {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.update(version);
            System.out.println("Version updated for school: " + version.getSchoolId());
        } catch (Exception e) {
            System.out.println("Error updating version: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }

    public void updateRequirement(Map<String, Object> data) {
        Session session = sessionFactory.getCurrentSession();
        try {
            Integer schoolId = (Integer) data.get("schoolId");
            Version version = findBySchoolId(schoolId);
            if (version == null) {
                version = new Version();
                version.setSchoolId(schoolId);
            }
            
            // Update the specific field
            for (Map.Entry<String, Object> entry : data.entrySet()) {
                if (!entry.getKey().equals("schoolId")) {
                    String field = entry.getKey();
                    Boolean value = (Boolean) entry.getValue();
                    switch(field) {
                        case "hasLogo": version.setHasLogo(value); break;
                        case "hasStudio": version.setHasStudio(value); break;
                        case "hasRecording": version.setHasRecording(value); break;
                        case "hasYoutubeUpload": version.setHasYoutubeUpload(value); break;
                        case "hasOutsideRecording": version.setHasOutsideRecording(value); break;
                        case "hasCollaboration": version.setHasCollaboration(value); break;
                        case "hasGreenScreen": version.setHasGreenScreen(value); break;
                    }
                }
            }
            
            // Calculate version level
            int level = calculateVersionLevel(version);
            version.setVersionLevel(level);
            
            session.saveOrUpdate(version);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    private int calculateVersionLevel(Version version) {
        if (version.getHasLogo() && version.getHasStudio() && version.getHasRecording()) {
            if (version.getHasYoutubeUpload() && version.getHasOutsideRecording()) {
                if (version.getHasCollaboration() && version.getHasGreenScreen()) {
                    return 3; // Advanced
                }
                return 2; // Intermediate
            }
            return 1; // Basic
        }
        return 0; // Not started
    }
}
