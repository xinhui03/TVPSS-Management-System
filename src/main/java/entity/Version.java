package entity;

import jakarta.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;

@Entity
@Table(name = "version")
public class Version implements Serializable {
    
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "school_id")
    private int schoolId;
    
    @Column(name = "version_number")
    private int versionNumber = 1; // Default value
    
    @Column(name = "logo_file")
    private String logoFile;
    
    @Column(name = "corner_file")
    private String cornerFile;
    
    @Column(name = "record_file")
    private String recordFile;
    
    @Column(name = "upload_file")
    private String uploadFile;
    
    @Column(name = "recordio_file")
    private String recordIOFile;
    
    @Column(name = "collab_file")
    private String collabFile;
    
    @Column(name = "tech_file")
    private String techFile;
    
    @Column(name = "logo_verified")
    private boolean logoVerified = false;
    
    @Column(name = "corner_verified")
    private boolean cornerVerified = false;
    
    @Column(name = "record_verified")
    private boolean recordVerified = false;
    
    @Column(name = "upload_verified")
    private boolean uploadVerified = false;
    
    @Column(name = "recordio_verified")
    private boolean recordIOVerified = false;
    
    @Column(name = "collab_verified")
    private boolean collabVerified = false;
    
    @Column(name = "tech_verified")
    private boolean techVerified = false;
    
    @Column(name = "status")
    private String status = "PENDING";
    
    @Column(name = "created_at", insertable = false, updatable = false)
    private Timestamp createdAt;
    
    @Column(name = "updated_at", insertable = false, updatable = false)
    private Timestamp updatedAt;

    // Default constructor
    public Version() {}

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public int getSchoolId() { return schoolId; }
    public void setSchoolId(int schoolId) { this.schoolId = schoolId; }
    
    public int getVersionNumber() { return versionNumber; }
    public void setVersionNumber(int versionNumber) { this.versionNumber = versionNumber; }
    
    public String getLogoFile() { return logoFile; }
    public void setLogoFile(String logoFile) { this.logoFile = logoFile; }
    
    public String getCornerFile() { return cornerFile; }
    public void setCornerFile(String cornerFile) { this.cornerFile = cornerFile; }
    
    public String getRecordFile() { return recordFile; }
    public void setRecordFile(String recordFile) { this.recordFile = recordFile; }
    
    public String getUploadFile() { return uploadFile; }
    public void setUploadFile(String uploadFile) { this.uploadFile = uploadFile; }
    
    public String getRecordIOFile() { return recordIOFile; }
    public void setRecordIOFile(String recordIOFile) { this.recordIOFile = recordIOFile; }
    
    public String getCollabFile() { return collabFile; }
    public void setCollabFile(String collabFile) { this.collabFile = collabFile; }
    
    public String getTechFile() { return techFile; }
    public void setTechFile(String techFile) { this.techFile = techFile; }
    
    public boolean isLogoVerified() { return logoVerified; }
    public void setLogoVerified(boolean logoVerified) { this.logoVerified = logoVerified; }
    
    public boolean isCornerVerified() { return cornerVerified; }
    public void setCornerVerified(boolean cornerVerified) { this.cornerVerified = cornerVerified; }
    
    public boolean isRecordVerified() { return recordVerified; }
    public void setRecordVerified(boolean recordVerified) { this.recordVerified = recordVerified; }
    
    public boolean isUploadVerified() { return uploadVerified; }
    public void setUploadVerified(boolean uploadVerified) { this.uploadVerified = uploadVerified; }
    
    public boolean isRecordIOVerified() { return recordIOVerified; }
    public void setRecordIOVerified(boolean recordIOVerified) { this.recordIOVerified = recordIOVerified; }
    
    public boolean isCollabVerified() { return collabVerified; }
    public void setCollabVerified(boolean collabVerified) { this.collabVerified = collabVerified; }
    
    public boolean isTechVerified() { return techVerified; }
    public void setTechVerified(boolean techVerified) { this.techVerified = techVerified; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
    
    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }

    // Helper method for JSP
    public boolean isVerified(String field) {
        switch (field) {
            case "logo": return isLogoVerified();
            case "corner": return isCornerVerified();
            case "record": return isRecordVerified();
            case "upload": return isUploadVerified();
            case "recordIO": return isRecordIOVerified();
            case "collab": return isCollabVerified();
            case "tech": return isTechVerified();
            default: return false;
        }
    }

    private List<List<Boolean>> versionRequirements = Arrays.asList(
        Arrays.asList(true, true, false, false, false, false, false, false, false, false, false, false),
        Arrays.asList(true, true, true, false, false, false, false, false, false, false, false, false),
        Arrays.asList(true, true, true, true, true, false, false, false, false, false, false, false),
        Arrays.asList(true, true, true, true, true, true, true, true, true, true, true, true)
    );

    public void updateVersion() {
        List<Boolean> currentStatus = Arrays.asList(
            isLogoVerified(),
            isCornerVerified(),
            isRecordVerified(),
            isUploadVerified(),
            isRecordIOVerified(),
            isCollabVerified(),
            isTechVerified(),
            false, // Placeholder for additional features
            false, // Placeholder for additional features
            false, // Placeholder for additional features
            false, // Placeholder for additional features
            false  // Placeholder for additional features
        );

        for (int i = versionRequirements.size() - 1; i >= 0; i--) {
            if (currentStatus.containsAll(versionRequirements.get(i))) {
                this.versionNumber = i + 1;
                break;
            }
        }

        this.status = (this.versionNumber == versionRequirements.size()) ? "COMPLETED" : "PENDING";
    }
}
