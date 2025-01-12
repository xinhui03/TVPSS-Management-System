package controller;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.MediaType;
import org.springframework.http.HttpHeaders;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;

import entity.Teacher;
import service.TeacherDAO_usingHibernate;
import service.VersionDAO_usingHibernate;
import entity.Version;
import entity.School;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Value("${upload.directory}")
	private String uploadDirectory;
	
	@Autowired //spring dependency injection
	private TeacherDAO_usingHibernate teacherDAO;
	
	@Autowired
	private VersionDAO_usingHibernate versionDAO;
	
	@RequestMapping("/dashboard")
	public String showDashboard() {
	    return "admin_dashboard";
	}

	@RequestMapping("/manageuser")
	public String getAllTeachers(Model model) {
	    List<Teacher> teacherList = teacherDAO.findAll();
	    model.addAttribute("teacherList", teacherList);
	    return "manage_user_admin"; 
	}
	
	@RequestMapping("/add1")
	@ResponseBody()
	public String add1(@ModelAttribute("teacher") Teacher teacher) {
		teacherDAO.save(teacher);
		return "adding .. " + teacher.toString();
	}
	
	@GetMapping("/add")
	public String add() {
		return "add_user_admin";
	}
	
	@PostMapping("/add")
	public String add(@ModelAttribute("teacher") Teacher teacher, Model
	model) {
		teacherDAO.save(teacher);
		model.addAttribute("teacher", teacher);
		return "redirect:/admin/manageuser";
	}
	
	@GetMapping("/edit")
	public String editTeacher(@ModelAttribute("id") int id, Model model) {
	    Teacher teacher = teacherDAO.findById(id); // Fetch teacher by ID
	    model.addAttribute("teacher", teacher);
	    return "edit_user_admin"; // Forward to the JSP for editing
	}

	@PostMapping("/update")
	public String updateTeacher(@ModelAttribute("teacher") Teacher teacher) {
	    teacherDAO.update(teacher); // Update the teacher in the database
	    return "redirect:/admin/manageuser"; // Redirect to manage user page after updating
	}
	
	@GetMapping("/delete")
	public String delete() {
		return "redirect:/admin/manageuser";
	}

	@PostMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		teacherDAO.delete(id);
		model.addAttribute("id", id);
		return "redirect:/admin/manageuser";
	}
	
	@GetMapping("/schools")
	public String getSchoolList(Model model) {
	    List<School> schoolList = teacherDAO.getDistinctSchools();
	    model.addAttribute("schoolList", schoolList);
	    return "admin_school_list";
	}

	@GetMapping("/school/details")
	public String viewSchoolDetails(@RequestParam("id") int id, Model model) {
	    Teacher teacher = teacherDAO.findById(id);
	    Version version = versionDAO.findById(id);
	    
	    if (teacher == null) {
	        return "redirect:/admin/schools";
	    }
	    
	    model.addAttribute("teacher", teacher);
	    model.addAttribute("version", version);
	    return "admin_school_version";
	}

	@GetMapping("/school/download")
	public ResponseEntity<Resource> downloadFile(
			@RequestParam("id") int id, 
			@RequestParam("field") String field) {
		try {
			Version version = versionDAO.findById(id);
			if (version == null) {
				return ResponseEntity.notFound().build();
			}

			String fileName = getFileNameByField(version, field);
			if (fileName == null || fileName.isEmpty()) {
				return ResponseEntity.notFound().build();
			}

			Path filePath = Paths.get(uploadDirectory, fileName);
			Resource resource = new FileSystemResource(filePath.toFile());

			if (!resource.exists()) {
				return ResponseEntity.notFound().build();
			}

			return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(resource);

		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	@GetMapping("/school/view")
	public ResponseEntity<Resource> viewFile(
			@RequestParam("id") int id, 
			@RequestParam("field") String field) {
		try {
			Version version = versionDAO.findById(id);
			if (version == null) {
				return ResponseEntity.notFound().build();
			}

			String fileName = getFileNameByField(version, field);
			if (fileName == null || fileName.isEmpty()) {
				return ResponseEntity.notFound().build();
			}

			// Add debug logging
			System.out.println("Viewing file: " + fileName + " for field: " + field);

			Path filePath = Paths.get(uploadDirectory, fileName);
			Resource resource = new FileSystemResource(filePath.toFile());

			if (!resource.exists()) {
				System.out.println("File not found: " + filePath);
				return ResponseEntity.notFound().build();
			}

			// Determine content type based on file extension
			String contentType = determineContentType(fileName);

			return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + fileName + "\"")
				.contentType(MediaType.parseMediaType(contentType))
				.body(resource);

		} catch (Exception e) {
			System.err.println("Error viewing file: " + e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	private String determineContentType(String fileName) {
		if (fileName.toLowerCase().endsWith(".pdf")) {
			return "application/pdf";
		} else if (fileName.toLowerCase().endsWith(".jpg") || fileName.toLowerCase().endsWith(".jpeg")) {
			return "image/jpeg";
		} else if (fileName.toLowerCase().endsWith(".png")) {
			return "image/png";
		} else if (fileName.toLowerCase().endsWith(".doc") || fileName.toLowerCase().endsWith(".docx")) {
			return "application/msword";
		} else {
			return "application/octet-stream";
		}
	}

	private String getFileNameByField(Version version, String field) {
		switch (field) {
			case "logo": return version.getLogoFile();
			case "corner": return version.getCornerFile();
			case "record": return version.getRecordFile();
			case "upload": return version.getUploadFile();
			case "recordIO": return version.getRecordIOFile();
			case "collab": return version.getCollabFile();
			case "tech": return version.getTechFile();
			default: return null;
		}
	}

	@PostMapping("/school/verify")
	public ResponseEntity<?> verifyRequirement(
			@RequestParam("id") int id,
			@RequestParam("field") String field,
			@RequestParam("checked") boolean checked) {
		try {
			Version version = versionDAO.findById(id);
			if (version == null) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Version not found");
			}

			switch (field) {
				case "logo": version.setLogoVerified(checked); break;
				case "corner": version.setCornerVerified(checked); break;
				case "record": version.setRecordVerified(checked); break;
				case "upload": version.setUploadVerified(checked); break;
				case "recordIO": version.setRecordIOVerified(checked); break;
				case "collab": version.setCollabVerified(checked); break;
				case "tech": version.setTechVerified(checked); break;
				default: return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid field");
			}

			versionDAO.save(version);
			
			Map<String, Object> response = new HashMap<>();
			response.put("success", true);
			response.put("field", field);
			response.put("checked", checked);
			return ResponseEntity.ok(response);

		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
							   .body("Error updating verification status");
		}
	}

	@GetMapping("/school/version/{id}")
	public String viewSchoolVersion(@PathVariable("id") int id, Model model) {
		School school = teacherDAO.findSchoolById(id);
		Version version = versionDAO.findBySchoolId(id);
		
		if (school == null) {
			return "redirect:/admin/schools";
		}
		
		Map<String, String> requirements = new HashMap<>();
		if (version != null) {
			requirements.put("logo", version.getLogoFile());
			requirements.put("corner", version.getCornerFile());
			requirements.put("record", version.getRecordFile());
			requirements.put("upload", version.getUploadFile());
			requirements.put("recordIO", version.getRecordIOFile());
			requirements.put("collab", version.getCollabFile());
			requirements.put("tech", version.getTechFile());
		}
		
		model.addAttribute("school", school);
		model.addAttribute("version", version);
		model.addAttribute("requirements", requirements);
		return "admin_school_version";
	}
}