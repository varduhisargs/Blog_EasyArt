package hibernateUtil;

import entity.*;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import java.util.Properties;

public class SessionFactoryUtil {

    private SessionFactory sessionFactory;

    private static SessionFactoryUtil sessionFactoryRepo;

    private SessionFactoryUtil() {
        try {
            Configuration configuration = new Configuration();

            Properties settings = new Properties();
            settings.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
            settings.put(Environment.URL, "jdbc:mysql://localhost:3306/blog?useSSL=false");
            settings.put(Environment.USER, "root");
            settings.put(Environment.PASS, "root");
            settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");
            settings.put(Environment.HBM2DDL_AUTO, "none");
            settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
            configuration.setProperties(settings);
            configuration.addAnnotatedClass(User.class);
            configuration.addAnnotatedClass(Blog.class);
            configuration.addAnnotatedClass(Category.class);
            configuration.addAnnotatedClass(UserRole.class);
            configuration.addAnnotatedClass(Comment.class);
            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties()).build();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public synchronized static SessionFactoryUtil getInstance() {
        if (sessionFactoryRepo == null) {
            sessionFactoryRepo = new SessionFactoryUtil();
        }
        return sessionFactoryRepo;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }



}
