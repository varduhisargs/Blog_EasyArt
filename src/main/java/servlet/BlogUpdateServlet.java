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
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet("/api/user/blog/update")
@MultipartConfig
public class BlogUpdateServlet extends HttpServlet {

    private BlogRepository blogRepository;
    private CategoryRepository categoryRepository;

    public BlogUpdateServlet() {
        blogRepository = new BlogRepository();
        categoryRepository = new CategoryRepository();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String blogId = req.getParameter("blogId");
        long id = Long.parseLong(blogId);
        Blog blog = blogRepository.getBlogById(id);
        req.setAttribute("blog", blog);
        List<Category> allCategorise = categoryRepository.getAllCategorise();
        req.setAttribute("allCategorise", allCategorise);
        req.getRequestDispatcher("/WEB-INF/view/blog_update.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String description = req.getParameter("description");

        String blogId = req.getParameter("blogId");
        long id = Long.parseLong(blogId);
        Blog blogById = blogRepository.getBlogById(id);

        Part image = req.getPart("image");
        String imagePath;
        if (image != null && image.getSize() > 0) {
            imagePath = System.currentTimeMillis() + image.getSubmittedFileName();
            image.write(getServletContext().getRealPath("/assets/images") + "\\" + imagePath);
        } else {
            imagePath = blogById.getImage();
        }


        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        String[] categoriesIds = req.getParameterValues("categoriesIds");
        Set<Category> categories = new HashSet<>();
        if (categoriesIds != null) {
            for (String categoriesId : categoriesIds) {
                long parseLong = Long.parseLong(categoriesId);
                Category category = categoryRepository.getCategoriesById(parseLong);
                categories.add(category);
            }
        }


        Blog blog = Blog.builder()
                .id(blogById.getId())
                .title(title)
                .description(description)
                .categoryList(categories)
                .createdDate(blogById.getCreatedDate())
                .image(imagePath)
                .user(user)
                .build();
        blogRepository.update(blog);
        resp.sendRedirect("/api/user/blog");

    }
}
