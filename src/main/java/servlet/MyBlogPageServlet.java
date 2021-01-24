package servlet;

import entity.Blog;
import entity.User;
import repository.BlogRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/api/user/blog")
public class MyBlogPageServlet extends HttpServlet {

    private BlogRepository blogRepository;

    public MyBlogPageServlet() {
        blogRepository = new BlogRepository();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        List<Blog> blogList = blogRepository.getBlogByUserId(user.getId());
        req.setAttribute("blogList", blogList);
        req.getRequestDispatcher("/WEB-INF/view/user_blog.jsp").forward(req, resp);
    }

}
