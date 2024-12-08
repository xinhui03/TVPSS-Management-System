import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/SchoolInfo_teacher")
public class SchoolInfo_teacher extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Define file upload path (change as per your file storage location)
        String uploadPath = getServletContext().getRealPath("/") + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();  // Create the directory if it doesn't exist
        }

        // Create a MultipartRequest to handle file uploads and form data
        MultipartRequest multipartRequest = new MultipartRequest(request, uploadPath);

        // Retrieve form data
        String schoolName = multipartRequest.getParameter("schoolName");
        String schoolAddress1 = multipartRequest.getParameter("schoolAddress1");
        String schoolAddress2 = multipartRequest.getParameter("schoolAddress2");
        String postcode = multipartRequest.getParameter("postcode");
        String state = multipartRequest.getParameter("state");
        String phoneNo = multipartRequest.getParameter("phoneNo");
        String email = multipartRequest.getParameter("email");
        String faxNo = multipartRequest.getParameter("faxNo");
        
        // Handle the uploaded file (schoolLogo)
        String schoolLogo = multipartRequest.getFilesystemName("schoolLogo");

        // Handle other fields (like video link)
        String videoLink = multipartRequest.getParameter("videoLink");

        // Store the data in request attributes to pass it back to the page
        request.setAttribute("schoolName", schoolName);
        request.setAttribute("schoolAddress1", schoolAddress1);
        request.setAttribute("schoolAddress2", schoolAddress2);
        request.setAttribute("postcode", postcode);
        request.setAttribute("state", state);
        request.setAttribute("phoneNo", phoneNo);
        request.setAttribute("email", email);
        request.setAttribute("faxNo", faxNo);
        request.setAttribute("schoolLogo", schoolLogo);  // File path or filename
        request.setAttribute("videoLink", videoLink);

        // Forward the request back to the same JSP page
        request.getRequestDispatcher("school_info_teacher.jsp").forward(request, response);
    }
}