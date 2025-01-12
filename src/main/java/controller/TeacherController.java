package controller;

import java.util.List;
import java.io.File;
import org.springframework.http.HttpStatus;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import entity.Teacher;
import entity.Student;
import service.TeacherDAO_usingHibernate;
import service.StudentDAO_usingHibernate;
import service.VersionDAO_usingHibernate;
import entity.Version;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	@Autowired
	private StudentDAO_usingHibernate studentDao;
	
	@Autowired
	private VersionDAO_usingHibernate versionDao;
	
	@RequestMapping("/dashboard")
	public String showDashboard() {
	    return "dashboard_teacher"; // This will forward to dashboard_admin.jsp
	}

	@RequestMapping("/manageuser")
	public String getAllStudents(Model model) {
	    List<Student> studentList = studentDao.findAll();
	    model.addAttribute("studentList", studentList);
	    return "manage_user_teacher"; 
	}
	
	@RequestMapping("/add1")
	@ResponseBody()
	public String add1(@ModelAttribute("student") Student student) {
		studentDao.save(student);
		return "adding .. " + student.toString();
	}
	
	@GetMapping("/add")
	public String add() {
		return "add_user_teacher";
	}
	
	@PostMapping("/add")
	public String add(@ModelAttribute("student") Student student, Model
	model) {
		studentDao.save(student);
		model.addAttribute("student", student);
		return "redirect:/teacher/manageuser";
	}
	
	@GetMapping("/edit")
	public String editStudent(@ModelAttribute("id") int id, Model model) {
	    Student student = studentDao.findById(id); // Fetch teacher by ID
	    model.addAttribute("student", student);
	    return "edit_user_teacher"; // Forward to the JSP for editing
	}

	@PostMapping("/update")
	public String updateStudent(@ModelAttribute("student") Student student) {
	    studentDao.update(student); // Update the teacher in the database
	    return "redirect:/teacher/manageuser"; // Redirect to manage user page after updating
	}
	
	@GetMapping("/delete")
	public String delete() {
		return "redirect:/teacher/manageuser";
	}

	@PostMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		studentDao.delete(id);
		model.addAttribute("id", id);
		return "redirect:/teacher/manageuser";
	}
	
	@RequestMapping("/version")
	public String versionPage() {
		return "teacher_school_version";
	}
	
	@GetMapping("/version")
	public String version() {
		return "redirect:/teacher/version";
	}

	@PostMapping("/version/upload")
	public ResponseEntity<?> uploadFile(
	        @RequestParam("id") int id,
	        @RequestParam("file") MultipartFile file,
	        @RequestParam("field") String field) {

	    try {
	        Version version = versionDao.findById(id);
	        if (version == null) {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Version not found");
	        }

	        // Save file to a directory (e.g., "uploads/")
	        String filePath = "uploads/" + file.getOriginalFilename();
	        file.transferTo(new File(filePath));

	        // Set the file path to the appropriate field
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
	            default:
	                return ResponseEntity.badRequest().body("Invalid field");
	        }

	        versionDao.save(version);
	        return ResponseEntity.ok("File uploaded successfully");

	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error uploading file");
	    }
	}

	@GetMapping("/version")
	public String showVersionPage(Model model) {
		return "teacher_school_version";
	}
}