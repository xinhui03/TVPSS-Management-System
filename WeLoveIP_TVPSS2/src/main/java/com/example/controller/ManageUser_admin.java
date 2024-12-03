package com.example.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ManageUser_admin")
public class ManageUser_admin extends HttpServlet {

    // Simulating a database with an in-memory list
    private static final List<User> users = new ArrayList<>();

    static {
        // Sample users for testing
        users.add(new User(1, "Zarif Bin Hakim", "zarif@moe-dl.edu.my", "Student"));
        users.add(new User(2, "Saleh Bin Ahmad", "saleh@moe-dl.edu.my", "Student"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action parameter is missing");
            return;
        }

        switch (action) {
            case "add":
                addUser(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        if (name == null || email == null || role == null || name.isEmpty() || email.isEmpty() || role.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("add_user_admin.jsp").forward(request, response);
            return;
        }

        // Generate new user ID
        int id = users.isEmpty() ? 1 : users.get(users.size() - 1).getId() + 1;

        // Add user to the list
        users.add(new User(id, name, email, role));

        // Redirect back to the manage user page
        response.sendRedirect("manage_user_admin.jsp");
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        // Find and update the user
        for (User user : users) {
            if (user.getId() == id) {
                user.setName(name);
                user.setEmail(email);
                user.setRole(role);
                break;
            }
        }

        // Redirect back to the manage user page
        response.sendRedirect("manage_user_admin.jsp");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Remove user by ID
        users.removeIf(user -> user.getId() == id);

        // Redirect back to the manage user page
        response.sendRedirect("manage_user_admin.jsp");
    }
}
