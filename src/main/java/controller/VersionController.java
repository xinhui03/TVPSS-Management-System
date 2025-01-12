package controller;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.HashSet;
import java.util.Arrays;
import java.util.Collections;
import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import entity.Teacher;
import entity.Student;
import entity.Version;
import service.TeacherDAO_usingHibernate;
import service.StudentDAO_usingHibernate;
import service.VersionDAO_usingHibernate;

@Controller
@RequestMapping("/version")
public class VersionController {

    private static final Logger logger = LoggerFactory.getLogger(VersionController.class);

    @Autowired
    private VersionDAO_usingHibernate versionDAO;

    @Value("${upload.directory}")
    private String uploadDirectory;

    private static final Set<String> VALID_FIELDS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
        "logo", "corner", "record", "upload", "recordIO", "collab", "tech"
    )));

    @PostMapping("/{id}/upload")
    public ResponseEntity<?> uploadFile(
            @PathVariable("id") int id,
            @RequestParam("file") MultipartFile file,
            @RequestParam("field") String field) {

        if (!VALID_FIELDS.contains(field)) {
            return ResponseEntity.badRequest().body("Invalid field");
        }

        try {
            Version version = versionDAO.findById(id);
            if (version == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Version not found");
            }

            // Save file
            String filePath = uploadDirectory + file.getOriginalFilename();
            file.transferTo(new File(filePath));

            // Update the appropriate field
            switch (field) {
                case "logo":
                    version.setLogoFile(filePath);
                    break;
                case "corner":
                    version.setCornerFile(filePath);
                    break;
                case "record":
                    version.setRecordFile(filePath);
                    break;
                case "upload":
                    version.setUploadFile(filePath);
                    break;
                case "recordIO":
                    version.setRecordIOFile(filePath);
                    break;
                case "collab":
                    version.setCollabFile(filePath);
                    break;
                case "tech":
                    version.setTechFile(filePath);
                    break;
            }

            versionDAO.save(version);
            return ResponseEntity.ok("File uploaded successfully");

        } catch (Exception e) {
            logger.error("Error uploading file for Version ID: " + id, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error uploading file");
        }
    }

    @PostMapping("/{id}/verify")
    public ResponseEntity<?> verifyRequirement(
            @PathVariable("id") int id,
            @RequestParam("field") String field,
            @RequestParam("checked") boolean checked) {

        try {
            Version version = versionDAO.findById(id);
            if (version == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Version not found");
            }

            // Update checkbox status
            switch (field) {
                case "logo":
                    version.setLogoVerified(checked);
                    break;
                case "corner":
                    version.setCornerVerified(checked);
                    break;
                case "record":
                    version.setRecordVerified(checked);
                    break;
                case "upload":
                    version.setUploadVerified(checked);
                    break;
                case "recordIO":
                    version.setRecordIOVerified(checked);
                    break;
                case "collab":
                    version.setCollabVerified(checked);
                    break;
                case "tech":
                    version.setTechVerified(checked);
                    break;
                default:
                    return ResponseEntity.badRequest().body("Invalid field");
            }

            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("field", field);
            response.put("checked", checked);
            
            versionDAO.save(version);
            return ResponseEntity.ok().body(response);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body("Error updating checkbox status");
        }
    }
}
