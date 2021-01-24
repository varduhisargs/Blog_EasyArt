package servlet;

import entity.Blog;
import entity.Comment;
import repository.BlogRepository;
import repository.CommentRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/api/post/*")
@MultipartConfig
public class BlogSinglePageServlet extends HttpServlet {

    private BlogRepository blogRepository;
    private CommentRepository commentRepository;

    public BlogSinglePageServlet() {

        blogRepository = new BlogRepository();
        commentRepository = new CommentRepository();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String requestURI = req.getRequestURI();
        String blogId = requestURI.substring(10);
        long id = Long.parseLong(blogId);
        Blog blog = blogRepository.getBlogById(id);
        req.setAttribute("blog", blog);
        List<Comment> comments = commentRepository.getCommentByBlogId(id);
        req.setAttribute("comments", comments);
        req.getRequestDispatcher("/WEB-INF/view/single_post.jsp").forward(req, resp);

    }

}
