package servlet;

import entity.User;
import entity.UserRole;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import repository.UserRepository;
import repository.UserRoleRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/api/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    private UserRepository userRepository;
    private UserRoleRepository userRoleRepository;

    public RegisterServlet() {
        userRepository = new UserRepository();
        userRoleRepository = new UserRoleRepository();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Part image = req.getPart("image");
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String hashPassword = bCryptPasswordEncoder.encode(password);
        UserRole userRole = userRoleRepository.getByUserRoleName("User");
        List<UserRole> userRoleList = new ArrayList<>();
        userRoleList.add(userRole);
        User byUsername = userRepository.getByUsername(username);
        if (byUsername == null) {
            String imagePath = null;
            if(image.getSize() > 0){
                imagePath = username + image.getSubmittedFileName();
                image.write(getServletContext().getRealPath("/assets/images") + "\\" + imagePath);
            }
            User user = User.builder()
                    .name(name)
                    .surname(surname)
                    .username(username)
                    .password(hashPassword)
                    .createdDate(new Date())
                    .userRoleList(userRoleList)
                    .image(imagePath)
                    .build();
            userRepository.save(user);
            resp.sendRedirect("/api/login");
        } else {
            resp.sendRedirect("/api/register?existUsername=true");
        }
    }
}
