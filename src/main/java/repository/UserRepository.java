package repository;

import entity.User;
import hibernateUtil.SessionFactoryUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UserRepository {

    SessionFactory sessionFactory;

    public UserRepository() {
        sessionFactory = SessionFactoryUtil.getInstance().getSessionFactory();
    }

    public User save(User user) {

        try (Session session = sessionFactory.getCurrentSession()) {
            Transaction transaction = session.getTransaction();
            transaction.begin();
            session.save(user);
            transaction.commit();
            return user;

        }

    }

    public User getByUsername(String username) {

        try (Session session = sessionFactory.getCurrentSession()) {
            Transaction transaction = session.getTransaction();
            transaction.begin();
            Query query = session.createQuery("select u from User u where  username = :username");
            query.setParameter("username", username);
            User user = (User) query.uniqueResult();
            transaction.commit();
            return user;
        }
    }

    public User update(User user) {

        try (Session session = sessionFactory.getCurrentSession()) {
            Transaction transaction = session.getTransaction();
            transaction.begin();
            session.update(user);
            transaction.commit();
            return user;
        }
    }
}
