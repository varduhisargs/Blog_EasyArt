package listener;

import hibernateUtil.SessionFactoryUtil;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ServletContext implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        SessionFactoryUtil.getInstance();
    }
}
