package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;

@WebServlet("/image/*")
public class ImageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String requestURI = req.getRequestURI();
        String imagePath = requestURI.replace("/image/", "");
        String absoluteImagePath = getServletContext().getRealPath("/assets/images") + "\\" + imagePath;
        try (FileInputStream fileInputStream = new FileInputStream(absoluteImagePath)){
            int oneByte;
            while ((oneByte = fileInputStream.read()) != -1){
                resp.getWriter().write(oneByte);
            }
        }
    }
}
