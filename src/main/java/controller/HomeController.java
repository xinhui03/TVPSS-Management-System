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
import service.CustomerDao_usingHibernate;

@Controller
@RequestMapping("/usinghibernate")
public class HomeController {
	@Autowired //spring dependency injection
	private CustomerDao_usingHibernate cDao_usingHibernate;

	@RequestMapping("/getall")
	public String getAllCustomers(Model model) {
	    List<Customer> customerList = cDao_usingHibernate.findAll();
	    model.addAttribute("customerList", customerList);
	    return "customerList"; 
	}
	
	@RequestMapping("/add1")
	@ResponseBody()
	public String add1(@ModelAttribute("customer") Customer customer) {
		cDao_usingHibernate.save(customer);
		return "adding .. " + customer.toString();
	}
	
	@GetMapping("/add")
	public String add() {
		return "formadd";
	}
	
	@PostMapping("/add")
	public String add(@ModelAttribute("customer") Customer customer, Model
	model) {
		cDao_usingHibernate.save(customer);
		model.addAttribute("customer", customer);
		return "confirmadded";
	}
	
	@GetMapping("/delete")
		public String delete() {
		return "formdelete";
	}
	
	@PostMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		cDao_usingHibernate.delete(id);
		model.addAttribute("id", id);
		return "confirmdeleted";
	}
}