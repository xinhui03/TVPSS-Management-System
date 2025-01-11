package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Customer;
import entity.Teacher;
import service.TeacherDAO_usingHibernate;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired //spring dependency injection
	private TeacherDAO_usingHibernate cDao_usingHibernate;
	
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




	


	
}