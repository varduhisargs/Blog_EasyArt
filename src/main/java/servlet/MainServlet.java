package servlet;

import entity.Blog;
import entity.Category;
import repository.BlogRepository;
import repository.CategoryRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/api")
public class MainServlet extends HttpServlet {

    private BlogRepository blogRepository;
    private CategoryRepository categoryRepository;

    public MainServlet() {
        blogRepository = new BlogRepository();
        categoryRepository = new CategoryRepository();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        String searchValue = req.getParameter("search");
        if (searchValue == null) {
            searchValue = "";
        }
        int pageNumber = 0;
        int pageSize = 2;
        if (page != null && !page.isEmpty()) {
            pageNumber = Integer.parseInt(page) * pageSize;
        }
        List<Long> categories = new ArrayList<>();
        String[] categoryIds = req.getParameterValues("categoryId");
        if (categoryIds != null) {
            for (String categoryId : categoryIds) {
                long id = Long.parseLong(categoryId);
                categories.add(id);
            }
        }
        req.setAttribute("categories", categories);

        List<Blog> all = blogRepository.getAll(pageNumber, pageSize, searchValue, categories);
        req.setAttribute("all", all);

        int pageCount = 0;
        int count = blogRepository.countAll(searchValue, categories);
        req.setAttribute("searchValue", searchValue);
        if (count != 0) {
            pageCount = count / pageSize;
            if (count % pageSize != 0) {
                pageCount += 1;
            }
        }
        req.setAttribute("pageCount", pageCount);
        List<Category> allCategorise = categoryRepository.getAllCategorise();
        req.setAttribute("allCategorise", allCategorise);


        req.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(req, resp);

    }
}
