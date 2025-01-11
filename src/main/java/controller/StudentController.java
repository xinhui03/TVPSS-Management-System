package controller;

import entity.CrewApplication;
import service.CrewApplicationDAO_usingHibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private CrewApplicationDAO_usingHibernate applicationDAO;

    // Crew application
    // Method to show the application form
    @GetMapping("/crew/apply")
    public String showApplicationForm() {
        return "apply_crew"; 
    }

    // Method to submit an application
    @PostMapping("/crew/submit")
    public String submitApplication(@ModelAttribute("application") CrewApplication application) {
        applicationDAO.save(application);
        return "redirect:/student/crew/viewApplications"; // Redirect to view applications after submission
    }

    // Method to view a specific application by ID
    @GetMapping("/crew/viewApplication")
    public String viewApplication(@ModelAttribute("id") int id, Model model) {
        CrewApplication application = applicationDAO.findById(id);
        model.addAttribute("application", application);
        return "view_application"; // JSP page to display application details
    }
} 