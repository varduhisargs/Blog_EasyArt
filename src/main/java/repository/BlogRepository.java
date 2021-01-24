package repository;

import entity.Blog;
import hibernateUtil.SessionFactoryUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class BlogRepository {

    SessionFactory sessionFactory;

    public BlogRepository() {
        sessionFactory = SessionFactoryUtil.getInstance().getSessionFactory();
    }


    public Blog save(Blog blog) {
        try (Session session = sessionFactory.getCurrentSession()) {
            Transaction transaction = session.getTransaction();
            transaction.begin();
            session.save(blog);
            transaction.commit();
            session.close();
            return blog;
        }
    }

    public Blog getBlogById(long id) {

        try (Session session = sessionFactory.getCurrentSession()) {
            Transaction transaction = session.getTransaction();
            transaction.begin();
            Blog blog = session.find(Blog.class, id);
            transaction.commit();
            return blog;
        }

    }

    public List<Blog> getBlogByUserId(long id) {

        try (Session session = sessionFactory.getCurrentSession();) {
            Transaction transaction = session.getTransaction();
            transaction.begin();
            Query query = session.createQuery("select b from Blog b where b.user.id =:user_id order by b.createdDate desc ");
            query.setParameter("user_id", id);
            List<Blog> list = (List<Blog>) query.list();
            transaction.commit();
            return list;
        }
    }

    public void deleteBlog(Blog blog) {
        try (Session session = sessionFactory.getCurrentSession()) {
            Transaction transaction = session.getTransaction();
            transaction.begin();
            session.remove(blog);
            transaction.commit();
        }
    }

    public Blog update(Blog blog) {
        try (Session session = sessionFactory.getCurrentSession()) {
            Transaction transaction = session.getTransaction();
            transaction.begin();
            session.update(blog);
            transaction.commit();
            return blog;
        }
    }

    public List<Blog> getAll(int pageNumber, int pageSize, String searchValue, List<Long> categoryId) {

        try (Session session = sessionFactory.getCurrentSession()) {
            Transaction transaction = session.getTransaction();
            transaction.begin();
            Query query;
            if (!categoryId.isEmpty()) {
                query = session.createQuery("select b from Blog b join b.categoryList c where b.title like :searchValue and c.id in :categoryId order by b.createdDate desc");
                query.setParameter("searchValue", "%" + searchValue + "%");
                query.setParameterList("categoryId", categoryId);
            } else {
                query = session.createQuery("select b from Blog b where b.title like :searchValue order by b.createdDate desc");
                query.setParameter("searchValue", "%" + searchValue + "%");
            }
            query.setFirstResult(pageNumber);
            query.setMaxResults(pageSize);
            List<Blog> blogList = (List<Blog>) query.list();
            transaction.commit();
            return blogList;
        }
    }

    public int countAll(String searchValue, List<Long> categoryId) {
        try (Session session = sessionFactory.getCurrentSession()) {
            Transaction transaction = session.getTransaction();
            transaction.begin();
            Query query;
            if (!categoryId.isEmpty()) {
                query = session.createQuery("select b from Blog b join b.categoryList c where b.title like :searchValue and c.id  in :categoryId ");
                query.setParameter("searchValue", "%" + searchValue + "%");
                query.setParameter("categoryId", categoryId);
            } else {
                 query = session.createQuery("select b from Blog b where b.title like :searchValue");
                query.setParameter("searchValue", "%" + searchValue + "%");
            }
            query.setParameter("searchValue", "%" + searchValue + "%");
            int size = query.list().size();
            transaction.commit();
            return size;
        }
    }
}
