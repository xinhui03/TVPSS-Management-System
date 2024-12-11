package com.example.controller;

import com.example.model.User;
@WebServlet("/ManageUser_teacher")
public class ManageUser_teacher extends HttpServlet {

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

        // Generate new user ID
        int id = users.size() + 1;

        // Add user to the list
        users.add(new User(id, name, email, role));

        // Redirect back to the manage user page after adding user
        response.sendRedirect("manage_user_teacher.jsp");
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
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

        // Redirect back to the manage user page after editing user
        response.sendRedirect("manage_user_teacher.jsp");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Remove user by ID
        users.removeIf(user -> user.getId() == id);

        // Redirect back to the manage user page after deleting user
        response.sendRedirect("manage_user_teacher.jsp");
    }
}
