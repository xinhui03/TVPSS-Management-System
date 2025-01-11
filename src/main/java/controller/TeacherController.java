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
import entity.Student;
import service.TeacherDAO_usingHibernate;
import service.StudentDAO_usingHibernate;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	@Autowired //spring dependency injection
	private StudentDAO_usingHibernate cDao_usingHibernate;
	
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
	
	@GetMapping("/edit")
	public String editStudent(@ModelAttribute("id") int id, Model model) {
	    Student student = cDao_usingHibernate.findById(id); // Fetch teacher by ID
	    model.addAttribute("student", student);
	    return "edit_user_teacher"; // Forward to the JSP for editing
	}

	@PostMapping("/update")
	public String updateStudent(@ModelAttribute("student") Student student) {
	    cDao_usingHibernate.update(student); // Update the teacher in the database
	    return "redirect:/teacher/manageuser"; // Redirect to manage user page after updating
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




	


	
}