package com.example.controller;

import com.example.model.School;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SchoolInfo_admin")
public class SchoolInfo_admin extends HttpServlet {
    // Simulating a database with an in-memory list
    private static final List<School> schools = new ArrayList<>();
       
    static {
        // Preloaded sample data
        schools.add(new School(1, "SMK Air Tawar", "Jalan Persiaran Utama", "PPD Johor Bahru, Skudai", "81900", "07-1234567", "Kota Tinggi", "03-1234567", "airtawar@school.edu.my", "school_logo.jpg", "http://tvpss-airtawar.youtube.com"));
        schools.add(new School(2, "SMK Banang Jaya", "Jalan Indah", "SDF Johor Bahru", "83000", "07-7654321", "Batu Pahat", "02-1234567", "banangjaya@school.edu.my", "school_logo2.jpg", "http://tvpss-banangjaya.youtube.com"));
        schools.add(new School(3, "SMK Bandar Mas", "Jalan Cahaya", "TBV Johor Bahru", "81900", "07-5432123", "Kota Tinggi", "01-1234567", "bandarmas@school.edu.my", "school_logo3.jpg", "http://tvpss-bandarmas.youtube.com"));
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
        // Retrieve school ID from the request
        int id = Integer.parseInt(request.getParameter("id"));

        // Find the school by ID
        School school = schools.stream()
                .filter(s -> s.getId() == id)
                .findFirst()
                .orElse(null);

        if (school == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "School not found");
            return;
        }

        // Pass the school object to the JSP
        request.setAttribute("school", school);
        request.getRequestDispatcher("/view_school_info_admin.jsp").forward(request, response);
    }

}