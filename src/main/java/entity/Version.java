package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "version")
public class Version {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "school_id")
    private Integer schoolId;
    
    private boolean hasLogo;
    private boolean hasStudio;
    private boolean hasRecording;
    private boolean hasYoutubeUpload;
    private boolean hasOutsideRecording;
    private boolean hasCollaboration;
    private boolean hasGreenScreen;
    
    private int versionLevel; // 1, 2, or 3

    // Update version logic
    public void updateVersionLevel() {
        if (hasLogo) {
            versionLevel = 1;
            
            if ((hasStudio && hasRecording) || (hasStudio && hasCollaboration)) {
                versionLevel = 2;
                
                if (hasOutsideRecording&&hasGreenScreen) {
                    versionLevel = 3;
                }
            }
        } else {
            versionLevel = 0; // Not qualified for any version
        }
    }

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    public Boolean getHasLogo() {
        return hasLogo;
    }

    public void setHasLogo(Boolean hasLogo) {
        this.hasLogo = hasLogo;
    }

    public Boolean getHasStudio() {
        return hasStudio;
    }

    public void setHasStudio(Boolean hasStudio) {
        this.hasStudio = hasStudio;
    }

    public Boolean getHasRecording() {
        return hasRecording;
    }

    public void setHasRecording(Boolean hasRecording) {
        this.hasRecording = hasRecording;
    }

    public Boolean getHasYoutubeUpload() {
        return hasYoutubeUpload;
    }

    public void setHasYoutubeUpload(Boolean hasYoutubeUpload) {
        this.hasYoutubeUpload = hasYoutubeUpload;
    }

    public Boolean getHasOutsideRecording() {
        return hasOutsideRecording;
    }

    public void setHasOutsideRecording(Boolean hasOutsideRecording) {
        this.hasOutsideRecording = hasOutsideRecording;
    }

    public Boolean getHasCollaboration() {
        return hasCollaboration;
    }

    public void setHasCollaboration(Boolean hasCollaboration) {
        this.hasCollaboration = hasCollaboration;
    }

    public Boolean getHasGreenScreen() {
        return hasGreenScreen;
    }

    public void setHasGreenScreen(Boolean hasGreenScreen) {
        this.hasGreenScreen = hasGreenScreen;
    }

    public int getVersionLevel() {
        return versionLevel;
    }

    public void setVersionLevel(int versionLevel) {
        this.versionLevel = versionLevel;
    }
} 