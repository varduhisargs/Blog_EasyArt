package repository;

import entity.Category;
import hibernateUtil.SessionFactoryUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class CategoryRepository {

    SessionFactory sessionFactory;

    public CategoryRepository() {
        sessionFactory = SessionFactoryUtil.getInstance().getSessionFactory();
    }

    public List<Category> getAllCategorise() {
        try (Session session = sessionFactory.getCurrentSession()) {
            Transaction transaction = session.getTransaction();
            transaction.begin();
            Query query = session.createQuery("select c from Category c ");
            List<Category> categoryList = (List<Category>) query.list();
            transaction.commit();
            return categoryList;
        }
    }

    public Category getCategoriesById(long id) {
        try (Session session = sessionFactory.getCurrentSession()) {
            Transaction transaction = session.getTransaction();
            transaction.begin();
            Category category = session.find(Category.class, id);
            transaction.commit();
            return category;
        }

    }

}
