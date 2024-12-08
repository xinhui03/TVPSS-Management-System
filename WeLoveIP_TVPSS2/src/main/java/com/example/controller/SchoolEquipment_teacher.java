package com.example.controller;

import com.example.model.School;
import com.example.model.Equipment;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SchoolEquipment_teacher")
public class SchoolEquipment_teacher extends HttpServlet {
	// Simulating a database with an in-memory list
	private static final List<School> schools = new ArrayList<>();

	static {
		School school1 = new School(1, "SMK Air Tawar", "Jalan Persiaran Utama", "PPD Johor Bahru, Skudai", "81900", "07-1234567", "Kota Tinggi", "03-1234567", "airtawar@school.edu.my", "school_logo.jpg", "http://tvpss-airtawar.youtube.com");
		school1.addEquipment(new Equipment("Nikon D850 Camera", "Camera", "Work"));
		school1.addEquipment(new Equipment("Microphone Shure Sm58", "Microphone", "Inactive"));

		schools.add(school1);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String action = request.getParameter("action");

	    switch (action) {
	        case "edit":
	            viewSchool(request, response);
	            break;
	        case "save":
	            saveEquipment(request, response);
	            break;
	        default:
	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
	    }
	}

	private void saveEquipment(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    int schoolId = Integer.parseInt(request.getParameter("schoolId"));
	    School school = schools.stream().filter(s -> s.getId() == schoolId).findFirst().orElse(null);

	    if (school != null) {
	        String modelName = request.getParameter("modelName");
	        String type = request.getParameter("type");
	        String status = request.getParameter("status");

	        // Add the new equipment to the school's list
	        Equipment newEquipment = new Equipment(modelName, type, status);
	        school.addEquipment(newEquipment);
	    }

	    // Redirect back to the equipment page
	    response.sendRedirect("school_equipment_teacher.jsp");
	}

	private void viewSchool(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		School school = schools.stream().filter(s -> s.getId() == id).findFirst().orElse(null);

		if (school == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "School not found");
			return;
		}

		// Set the school and equipment list attributes
		request.setAttribute("school", school);
		request.setAttribute("equipmentList", school.getEquipmentList());

		// Forward to JSP
		request.getRequestDispatcher("edit_school_equipment_teacher.jsp").forward(request, response);
	}
}