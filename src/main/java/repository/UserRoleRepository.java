package repository;

import entity.UserRole;
import hibernateUtil.SessionFactoryUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UserRoleRepository {
    SessionFactory sessionFactory;

    public UserRoleRepository() {
        sessionFactory = SessionFactoryUtil.getInstance().getSessionFactory();
    }

    public UserRole getByUserRoleName(String name) {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.getTransaction();
        transaction.begin();
        Query query = session.createQuery("select ur from UserRole ur where name = :name");
        query.setParameter("name", name);
        UserRole userRole = (UserRole) query.uniqueResult();
        transaction.commit();
        session.close();
        return userRole;
    }

}
