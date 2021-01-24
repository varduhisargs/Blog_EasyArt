package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(value = "/*")
public class AuthenticationFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        String requestURI = request.getRequestURI();
        if (user != null) {
            if (requestURI.equals("/api/login") || requestURI.equals("/api/register")) {
                response.sendRedirect("/api");
                return;
            }
        } else {
            if (requestURI.equals("/api/user/page") || requestURI.equals("/api/blog/create") || requestURI.equals("/api/user/blog") || requestURI.contains("/api/user/blog/update")) {
                response.sendRedirect("/api");
                return;
            }
        }
        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
