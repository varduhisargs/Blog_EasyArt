package servlet;

import entity.Blog;
import entity.Comment;
import entity.User;
import repository.BlogRepository;
import repository.CommentRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@WebServlet("/api/post/comment")

public class CommentServlet extends HttpServlet {

    private CommentRepository commentRepository;
    private BlogRepository blogRepository;

    public CommentServlet() {
        commentRepository = new CommentRepository();
        blogRepository = new BlogRepository();
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String blogId = req.getParameter("blogId");
        long id = Long.parseLong(blogId);
        Blog blog = blogRepository.getBlogById(id);
        String text = req.getParameter("text");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        Comment comment = Comment.builder()
                .text(text)
                .blog(blog)
                .user(user)
                .createdDate(new Date())
                .build();
        commentRepository.save(comment);
        resp.sendRedirect("/api/post/" + blog.getId());

    }
}
