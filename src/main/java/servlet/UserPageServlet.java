package servlet;

import entity.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/api/user/page")
@MultipartConfig
public class UserPageServlet extends HttpServlet {

    private UserRepository userRepository;

    public UserPageServlet() {
        userRepository = new UserRepository();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/user_page.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        long userId = Long.parseLong(id);
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Part image = req.getPart("image");
        HttpSession session = req.getSession();
        User sessionUser = (User) session.getAttribute("user");
        String hashPassword;
        if (password != null && !password.isEmpty()) {
            BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
            hashPassword = bCryptPasswordEncoder.encode(password);
        } else {
            hashPassword = sessionUser.getPassword();
        }
        String imagePath;
        if (image.getSize() == 0) {
            imagePath = sessionUser.getImage();
        } else {
            imagePath = username + image.getSubmittedFileName();
            image.write(getServletContext().getRealPath("/assets/images") + "\\" + imagePath);
        }
        if (username != null && !username.isEmpty()) {
            User byUsername = userRepository.getByUsername(username);
            if (byUsername == null || byUsername.getId() == sessionUser.getId()) {
                User user = User.builder()
                        .id(userId)
                        .name(name)
                        .surname(surname)
                        .username(username)
                        .password(hashPassword)
                        .createdDate(sessionUser.getCreatedDate())
                        .image(imagePath)
                        .userRoleList(sessionUser.getUserRoleList())
                        .build();
                userRepository.update(user);
                session.setAttribute("user", user);
                resp.sendRedirect("/api/user/page");
                return;
            }
            resp.sendRedirect("/api/user/page?existUsername=true");
            return;
        }
        resp.sendRedirect("/api/user/page");
    }

}

