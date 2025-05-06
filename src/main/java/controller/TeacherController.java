package controller;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import entity.Teacher;
import service.VersionDAO;
import entity.Version;

import entity.CrewApplication;
import entity.Equipment;
import entity.SchoolInfo;
import entity.Student;
import service.TeacherDAO_usingHibernate;
import service.StudentDAO_usingHibernate;
import service.CrewApplicationDAO_usingHibernate;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	@Autowired //spring dependency injection
	private StudentDAO_usingHibernate cDao_usingHibernate;
	@Autowired
	private TeacherDAO_usingHibernate tDao_usingHibernate;
	@Autowired
	private CrewApplicationDAO_usingHibernate applicationDAO;
	
	@Autowired
	private VersionDAO versionDAO;

	
	@RequestMapping("/dashboard")
	public String showDashboard() {
	    return "dashboard_teacher"; // This will forward to dashboard_admin.jsp
	}

	@RequestMapping("/manageuser")
	public String getAllStudents(Model model) {
	    List<Student> studentList = cDao_usingHibernate.findAll();
	    model.addAttribute("studentList", studentList);
	    return "manage_user_teacher"; 
	}
	
	@GetMapping("/manageschoolinfo")
	public String manageschoolinfo() {
		return "manageSchoolInfo_teacher";
	}
	
	@RequestMapping("/manageschoolinfoo")
	public String getAllSchoolInfo(Model model) {
	    List<SchoolInfo> schoolList = tDao_usingHibernate.findAllInfo();
	    model.addAttribute("schoolList", schoolList);
	    return "manageSchoolInfo_teacher"; 
	}
	
	@RequestMapping("/manageequipinfoo")
	public String getAllEquippInfo(Model model) {
	    List<Equipment> equipList = tDao_usingHibernate.findAllEquipInfo();
	    model.addAttribute("equipList", equipList);
	    return "manageEquipmentInfo_teacher"; 
	}
	
	@PostMapping("/manageschoolinfo")
	public String manageschoolinfo(@ModelAttribute("school") SchoolInfo school, Model
	model) {
		tDao_usingHibernate.saveSchoolInfo(school);
		model.addAttribute("school", school);
		return "redirect:/teacher/viewSchoolInfo?id=" + school.getId();
	}
	
	@RequestMapping("/manageequipinfo")
	public String getAllEquipInfo(Model model) {
	    List<Equipment> equipList = tDao_usingHibernate.findAllEquipInfo();
	    model.addAttribute("equipList", equipList);
	    return "manageEquipmentInfo_teacher"; 
	}
	
	@RequestMapping("/add1")
	@ResponseBody()
	public String add1(@ModelAttribute("student") Student student) {
		cDao_usingHibernate.save(student);
		return "adding .. " + student.toString();
	}
	
	@GetMapping("/add")
	public String add() {
		return "add_user_teacher";
	}
	
	@PostMapping("/add")
	public String add(@ModelAttribute("student") Student student, Model
	model) {
		cDao_usingHibernate.save(student);
		model.addAttribute("student", student);
		return "redirect:/teacher/manageuser";
	}
	
	@GetMapping("/addEquip")
	public String addEquip() {
		return "addEquipModel_teacher";
	}
	
	@PostMapping("/addEquip")
	public String addEquip(@ModelAttribute("equip") Equipment equip, Model
	model) {
		tDao_usingHibernate.saveEquipInfo(equip);
		model.addAttribute("equip", equip);
		return "redirect:/teacher/manageequipinfo";
	}
	
	@PostMapping("/submit")
	public String submitSchoolInfo(@ModelAttribute SchoolInfo school, Model model) {
	    // Save or update the school information using the DAO
	    tDao_usingHibernate.saveSchoolInfo(school);

	    // Redirect to the page showing all school information
	    return "redirect:/teacher/viewSchoolInfo?id=" + school.getId();
	}
	
	@GetMapping("/viewSchoolInfo")
	public String viewSchoolInfo(@ModelAttribute("id") int id, Model model) {
	    SchoolInfo school = tDao_usingHibernate.findBySchoolId(id); // Fetch teacher by ID
	    if (school != null) {
	        model.addAttribute("school", school); // Add the school object to the model
	        System.out.println("School found: " + school.getSchoolName()); // Debug log
	    }
	    return "viewSchoolInfo_teacher"; // Forward to the JSP for viewing
	}
	
	@GetMapping("/edit")
	public String editStudent(@ModelAttribute("id") int id, Model model) {
	    Student student = cDao_usingHibernate.findById(id); // Fetch teacher by ID
	    model.addAttribute("student", student);
	    return "edit_user_teacher"; // Forward to the JSP for editing
	}
	
	@GetMapping("/editEquip")
	public String editEquipment(@ModelAttribute("id") int id, Model model) {
	    Equipment equip = tDao_usingHibernate.findByEquipId(id); // Fetch teacher by ID
	    model.addAttribute("equip", equip);
	    return "editEquipModel_teacher"; // Forward to the JSP for editing
	}
	
	@GetMapping("/editSchoolInfo")
	public String editStudentInfo(@ModelAttribute("id") int id, Model model) {
	    SchoolInfo school = tDao_usingHibernate.findBySchoolId(id); // Fetch teacher by ID
	    model.addAttribute("school", school);
	    return "editSchoolInfo_teacher"; // Forward to the JSP for editing
	}
	
	@PostMapping("/updateSchoolInfo")
	public String updateSchoolInfo(@ModelAttribute("school") SchoolInfo school) {
	    tDao_usingHibernate.updateSchoolInfo(school); // Update the school in the database
	    return "redirect:/teacher/viewSchoolInfo?id=" + school.getId();
	}


	@PostMapping("/update")
	public String updateStudent(@ModelAttribute("student") Student student) {
	    cDao_usingHibernate.update(student); // Update the teacher in the database
	    return "redirect:/teacher/manageuser"; // Redirect to manage user page after updating
	}
	
	@PostMapping("/updateEquip")
	public String updateEquipment(@ModelAttribute("equip") Equipment equip) {
	    tDao_usingHibernate.updateEquip(equip); // Update the teacher in the database
	    return "redirect:/teacher/manageequipinfo"; // Redirect to manage user page after updating
	}
	
	@GetMapping("/delete")
	public String delete() {
		return "redirect:/teacher/manageuser";
	}

	@PostMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		cDao_usingHibernate.delete(id);
		model.addAttribute("id", id);
		return "redirect:/teacher/manageuser";
	}

	@GetMapping("/deleteEquip")
	public String deleteEquip() {
		return "redirect:/teacher/manageequipinfo";
	}

	@PostMapping("/deleteEquip")
	public String deleteEquip(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		tDao_usingHibernate.deleteEquip(id);
		model.addAttribute("id", id);
		return "redirect:/teacher/manageequipinfo";
	}
	
	@GetMapping("/crew/manageApplications")
	public String manageApplications(
					@RequestParam(defaultValue = "1") int page,
					@RequestParam(defaultValue = "10") int size,
					Model model) {
			List<CrewApplication> applications = applicationDAO.findAll();
			
			// Calculate pagination
			int totalItems = applications.size();
			int totalPages = (int) Math.ceil((double) totalItems / size);
			int startItem = (page - 1) * size;
			int endItem = Math.min(startItem + size, totalItems);
			
			List<CrewApplication> paginatedApplications = applications.subList(startItem, endItem);
			
			model.addAttribute("applications", paginatedApplications);
			model.addAttribute("currentPage", page);
			model.addAttribute("totalPages", totalPages);
			
			return "teachers/manage_applications";
	}

	@PostMapping("/crew/approveApplication")
	public String approveApplication(@RequestParam("id") int id) {
		applicationDAO.approve(id);
		return "redirect:/teacher/crew/manageApplications";
	}

	@PostMapping("/crew/rejectApplication")
	public String rejectApplication(@RequestParam("id") int id) {
			applicationDAO.reject(id);
			return "redirect:/teacher/crew/manageApplications";
	}
		
	@GetMapping("/crew/viewApplication")
	public String viewApplication(@RequestParam("id") int id, Model model) {
		CrewApplication application = applicationDAO.findById(id);
		model.addAttribute("application", application);
		return "teachers/view_application"; // JSP page to display application details
	}

	@PostMapping("/crew/deleteApplication")
	public String deleteApplication(@ModelAttribute("id") int id) {
		applicationDAO.delete(id);
		return "redirect:/teacher/crew/manageApplications"; 
	}
	
	@GetMapping("/version")
	public String teacherVersion() {
		return "teachers/teacher_version";
	}

	@PostMapping("/uploadRequirement")
	@ResponseBody
	public ResponseEntity<?> uploadRequirement(
			@RequestParam("file") MultipartFile file,
			@RequestParam("type") String type,
			@RequestParam("schoolId") Integer schoolId) {
		try {
			// Get file details
			String fileName = file.getOriginalFilename();
			String fileType = file.getContentType();
			byte[] fileContent = file.getBytes();
			
			// Update version based on requirement type
			Version version = versionDAO.findBySchoolId(schoolId);
			if (version == null) {
				version = new Version();
				version.setSchoolId(schoolId);
			}
			
			// Set the appropriate field based on type
			switch(type) {
				case "logo":
					version.setHasLogo(true);
					break;
				case "studio":
					version.setHasStudio(true);
					break;
				case "recording":
					version.setHasRecording(true);
					break;
				case "youtube":
					version.setHasYoutubeUpload(true);
					break;
				case "outside":
					version.setHasOutsideRecording(true);
					break;
				case "collab":
					version.setHasCollaboration(true);
					break;
				case "greenscreen":
					version.setHasGreenScreen(true);
					break;
			}
			
			// Save file details to database
			version.updateVersionLevel();
			versionDAO.save(version);
			
			Map<String, Object> response = new HashMap<>();
			response.put("success", true);
			response.put("message", "File uploaded successfully");
			response.put("fileName", fileName);
			response.put("versionLevel", version.getVersionLevel());
			return ResponseEntity.ok().body(response);
			
		} catch (Exception e) {
			Map<String, Object> response = new HashMap<>();
			response.put("success", false);
			response.put("error", e.getMessage());
			return ResponseEntity.badRequest().body(response);
		}
	}
}
