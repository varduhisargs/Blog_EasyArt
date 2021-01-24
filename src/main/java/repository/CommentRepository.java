package repository;

import entity.Comment;
import hibernateUtil.SessionFactoryUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class CommentRepository {
    private SessionFactory sessionFactory;

    public CommentRepository() {
        sessionFactory = SessionFactoryUtil.getInstance().getSessionFactory();
    }

    public List<Comment> getCommentByBlogId(long id) {
        try (Session session = sessionFactory.getCurrentSession()) {
            Transaction transaction = session.getTransaction();
            transaction.begin();
            Query query = session.createQuery("select c from Comment c  where c.blog.id = : blog_id order by c.createdDate desc ");
            query.setParameter("blog_id", id);
            List<Comment> list = (List<Comment>) query.list();
            transaction.commit();
            return list;
        }
    }

    public Comment save(Comment comment) {
        try (Session session = sessionFactory.getCurrentSession()) {
            Transaction transaction = session.getTransaction();
            transaction.begin();
            session.save(comment);
            transaction.commit();
            return comment;
        }

    }

}
