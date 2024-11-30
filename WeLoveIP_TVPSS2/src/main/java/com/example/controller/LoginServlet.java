package com.example.controller;

import com.example.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final Map<String, User> users = new HashMap<>();

    static {
        // Sample users for testing
        users.put("admin@admintvpss.com", new User("admin@admintvpss.com", "admin123"));
        users.put("teacher@gov.my", new User("teacher@gov.my", "teacher123"));
        users.put("student@moe-dl.edu.my", new User("student@moe-dl.edu.my", "student123"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("username");
        String password = request.getParameter("password");

        User user = users.get(email);

        if (user != null && user.getPassword().equals(password)) {
            if (email.endsWith("@admintvpss.com")) {
                request.getRequestDispatcher("/dashboard_admin.jsp").forward(request, response);
            } else if (email.endsWith("@gov.my")) {
                request.getRequestDispatcher("/dashboard_teacher.jsp").forward(request, response);
            } else if (email.endsWith("@moe-dl.edu.my")) {
                request.getRequestDispatcher("/dashboard_student.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message", "Invalid username or password.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
