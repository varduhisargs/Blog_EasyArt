package servlet;

import entity.Blog;
import entity.Category;
import entity.User;
import repository.BlogRepository;
import repository.CategoryRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/api/blog/create")
@MultipartConfig
public class BlogCreateServlet extends HttpServlet {

    private BlogRepository blogRepository;
    private CategoryRepository categoryRepository;

    public BlogCreateServlet() {
        blogRepository = new BlogRepository();
        categoryRepository = new CategoryRepository();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> allCategorise = categoryRepository.getAllCategorise();
        req.setAttribute("allCategorise", allCategorise);
        req.getRequestDispatcher("/WEB-INF/view/blog_create.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        Part image = req.getPart("image");
        String imagePath = null;
        if (image != null && image.getSize() > 0) {
            imagePath = System.currentTimeMillis() + image.getSubmittedFileName();
            image.write(getServletContext().getRealPath("/assets/images") + "\\" + imagePath);
        }


        Set<Category> categories = new HashSet<>();
        String[] categoriesIds = req.getParameterValues("categoriesIds");
        if (categoriesIds != null) {
            for (String categoriesId : categoriesIds) {
                long id = Long.parseLong(categoriesId);
                Category categoryById = categoryRepository.getCategoriesById(id);
                categories.add(categoryById);
            }

        }


        Blog blog = Blog.builder()

                .title(title)
                .description(description)
                .createdDate(new Date())
                .image(imagePath)
                .categoryList(categories)
                .user(user)
                .build();
        blogRepository.save(blog);
        resp.sendRedirect("/api/post/" + blog.getId());
    }
}
