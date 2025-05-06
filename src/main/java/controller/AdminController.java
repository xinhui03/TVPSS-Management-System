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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.transform.Transformers;
import java.util.ArrayList;



import entity.SchoolInfo;
import entity.Equipment;
import entity.Teacher;
import entity.Version;
import service.TeacherDAO_usingHibernate;
import service.VersionDAO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired //spring dependency injection
	private TeacherDAO_usingHibernate cDao_usingHibernate;
	@Autowired
	private TeacherDAO_usingHibernate tDao_usingHibernate;
	
	@Autowired
	private VersionDAO versionDAO;
	
	
	@RequestMapping("/dashboard")
	public String showDashboard() {
	    return "dashboard_admin"; // This will forward to dashboard_admin.jsp
	}

	@RequestMapping("/manageuser")
	public String getAllTeachers(Model model) {
	    List<Teacher> teacherList = cDao_usingHibernate.findAll();
	    model.addAttribute("teacherList", teacherList);
	    return "manage_user_admin"; 
	}
	
	@RequestMapping("/manageschoolinfo")
	public String getAllSchoolInfo(Model model) {
	    List<SchoolInfo> schoolList = tDao_usingHibernate.findAllInfo();
	    model.addAttribute("schoolList", schoolList);
	    return "manageSchoolInfo_admin"; 
	}
	
	@RequestMapping("/manageequipinfo")
	public String getAllEquipInfo(Model model) {
	    List<Equipment> equipList = tDao_usingHibernate.findAllEquipInfo();
	    model.addAttribute("equipList", equipList);
	    return "manageEquipmentInfo_admin"; 
	}
	
	@RequestMapping("/add1")
	@ResponseBody()
	public String add1(@ModelAttribute("teacher") Teacher teacher) {
		cDao_usingHibernate.save(teacher);
		return "adding .. " + teacher.toString();
	}
	
	@GetMapping("/add")
	public String add() {
		return "add_user_admin";
	}
	
	@PostMapping("/add")
	public String add(@ModelAttribute("teacher") Teacher teacher, Model
	model) {
		cDao_usingHibernate.save(teacher);
		model.addAttribute("teacher", teacher);
		return "redirect:/admin/manageuser";
	}
	
	@GetMapping("/view")
	public String viewEquip(@ModelAttribute("id") int id, Model model) {
	    Equipment equip = tDao_usingHibernate.findByEquipId(id); // Fetch teacher by ID
	    model.addAttribute("equip", equip);
	    return "viewEquip_admin"; // Forward to the JSP for viewing
	}
	
	@GetMapping("/viewSchoolInfo")
	public String viewSchoolInfo(@ModelAttribute("id") int id, Model model) {
	    SchoolInfo school = tDao_usingHibernate.findBySchoolId(id); // Fetch teacher by ID
	    model.addAttribute("school", school);
	    return "viewSchoolInfo_admin"; // Forward to the JSP for viewing
	}
	
	@GetMapping("/edit")
	public String editTeacher(@ModelAttribute("id") int id, Model model) {
	    Teacher teacher = cDao_usingHibernate.findById(id); // Fetch teacher by ID
	    model.addAttribute("teacher", teacher);
	    return "edit_user_admin"; // Forward to the JSP for editing
	}

	@PostMapping("/update")
	public String updateTeacher(@ModelAttribute("teacher") Teacher teacher) {
	    cDao_usingHibernate.update(teacher); // Update the teacher in the database
	    return "redirect:/admin/manageuser"; // Redirect to manage user page after updating
	}
	
	@PostMapping("/updateEquip")
	public String updateEquipment(@ModelAttribute("equip") Equipment equip) {
	    tDao_usingHibernate.updateEquip(equip); // Update the teacher in the database
	    return "redirect:/teacher/manageequipinfo"; // Redirect to manage user page after updating
	}
	
	@GetMapping("/delete")
	public String delete() {
		return "redirect:/admin/manageuser";
	}

	@PostMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		cDao_usingHibernate.delete(id);
		model.addAttribute("id", id);
		return "redirect:/admin/manageuser";
	}

	@PostMapping("/updateVersion")
	public String updateVersion(@RequestParam Integer schoolId,
	                              @RequestParam boolean hasLogo,
	                              @RequestParam boolean hasStudio,
	                              @RequestParam boolean hasRecording,
	                              @RequestParam boolean hasYoutubeUpload,
	                              @RequestParam boolean hasOutsideRecording,
	                              @RequestParam boolean hasCollaboration,
	                              @RequestParam boolean hasGreenScreen) {
		
		Version version = versionDAO.findBySchoolId(schoolId);
		if (version == null) {
			version = new Version();
			version.setSchoolId(schoolId);
		}
		
		version.setHasLogo(hasLogo);
		version.setHasStudio(hasStudio);
		version.setHasRecording(hasRecording);
		version.setHasYoutubeUpload(hasYoutubeUpload);
		version.setHasOutsideRecording(hasOutsideRecording);
		version.setHasCollaboration(hasCollaboration);
		version.setHasGreenScreen(hasGreenScreen);
		
		versionDAO.save(version);
		
		return "redirect:/admin/viewVersion";
	}
	
	@GetMapping("/viewVersion")
	public String viewVersion(@RequestParam Integer schoolId, Model model) {
		Version version = versionDAO.findBySchoolId(schoolId);
		model.addAttribute("version", version);
		return "admin/admin_verify";
	}

	@GetMapping("/versionList")
	public String getVersionList(Model model) {
		try {
			List<Map<String, Object>> versions = versionDAO.findAllVersionInfo();
			System.out.println("Found versions: " + versions.size());
			model.addAttribute("versions", versions);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/admin_version_list";
	}

	@GetMapping("/verify/{schoolId}")
	public String verifyVersion(@PathVariable Integer schoolId, Model model) {
		try {
			Version version = versionDAO.findBySchoolId(schoolId);
			model.addAttribute("version", version);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/admin_verify";
	}

	@PostMapping("/verify/update")
	@ResponseBody
	public Map<String, Object> updateRequirement(@RequestParam Integer schoolId, 
                                               @RequestParam String field,
                                               @RequestParam Boolean value) {
		try {
			Map<String, Object> data = new HashMap<>();
			data.put("schoolId", schoolId);
			data.put(field, value);
			versionDAO.updateRequirement(data);
			
			Map<String, Object> response = new HashMap<>();
			response.put("success", true);
			return response;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, Object> response = new HashMap<>();
			response.put("success", false);
			response.put("error", e.getMessage());
			return response;
		}
	}
}


	


	
