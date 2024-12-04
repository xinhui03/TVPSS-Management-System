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

@WebServlet("/SchoolEquipment_admin")
public class SchoolEquipment_admin extends HttpServlet {
    // Simulating a database with an in-memory list
    private static final List<School> schools = new ArrayList<>();

    static {
        School school1 = new School(1, "SMK Air Tawar", "Kota Tinggi", "81900", "07-1234567", "airtawar@school.edu.my");
        school1.addEquipment(new Equipment("Nikon D850 Camera", "Camera", "Work"));
        school1.addEquipment(new Equipment("Model B", "Type 2", "Inactive"));

        schools.add(school1);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("view".equals(action)) {
            viewSchool(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    private void viewSchool(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        School school = schools.stream()
                .filter(s -> s.getId() == id)
                .findFirst()
                .orElse(null);

        if (school == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "School not found");
            return;
        }

        // Set the school and equipment list attributes
        request.setAttribute("school", school);
        request.setAttribute("equipmentList", school.getEquipmentList());

        // Forward to JSP
        request.getRequestDispatcher("view_school_equipment_admin.jsp").forward(request, response);
    }
}