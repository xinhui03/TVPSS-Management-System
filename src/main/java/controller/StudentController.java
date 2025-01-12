package controller;

import entity.CrewApplication;
import service.CrewApplicationDAO_usingHibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private CrewApplicationDAO_usingHibernate applicationDAO;

    @RequestMapping("/dashboard")
    public String showDashboard() {
        return "students/dashboard_student"; // This will forward to dashboard_admin.jsp
    }
  

    // Crew application
    // Method to show the application form
    @GetMapping("/crew/apply")
    public String showApplicationForm() {
        return "students/apply_crew"; 
    }

    @PostMapping("/crew/submit")
    public String submitApplication(@ModelAttribute("application") CrewApplication application, Model model) {
        try {
            System.out.println("Attempting to save application: " + application.getStudentName());
            applicationDAO.save(application);
            return "redirect:/student/crew/viewAllApplications";
        } catch (Exception e) {
            e.printStackTrace(); // Add stack trace
            model.addAttribute("errorMessage", "Error saving application: " + e.getMessage());
            return "students/apply_crew";
        }
    }

    @GetMapping("/crew/viewAllApplications")
    public String viewAllApplications(Model model) {
        List<CrewApplication> applications = applicationDAO.findAll();
        model.addAttribute("applications", applications);
        return "students/view_all_applications"; // New JSP page to list all applications
    }

    @GetMapping("/crew/viewApplication")
    public String viewApplication(@RequestParam("id") int id, Model model) {
        System.out.println("Fetching application with ID: " + id); // Added logging
        CrewApplication application = applicationDAO.findById(id);
        if (application != null) {
            model.addAttribute("application", application);
            return "students/view_application"; // JSP page to display application details
        } else {
            model.addAttribute("errorMessage", "Application not found.");
            return "students/view_application"; // Redirect to the list if not found
        }
    }
} 