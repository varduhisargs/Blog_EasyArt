package servlet;

import entity.Blog;
import repository.BlogRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/api/user/blog/delete")
public class BlogDeleteServlet extends HttpServlet {

    private BlogRepository blogRepository;

    public BlogDeleteServlet() {
        blogRepository = new BlogRepository();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String blogId = req.getParameter("blogId");
        long id = Long.parseLong(blogId);
        Blog blog = blogRepository.getBlogById(id);
        blogRepository.deleteBlog(blog);
        resp.sendRedirect("/api/user/blog");
    }
}
