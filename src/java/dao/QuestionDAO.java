package dao;

import model.Question;
import org.hibernate.Session;
import util.HibernateUtil;

import java.util.List;

public class QuestionDAO {

    public void save(Question question) {

        Session session =
                HibernateUtil.getSessionFactory().openSession();

        try {

            session.beginTransaction();

            session.save(question);

            session.getTransaction().commit();

        } finally {

            session.close();
        }
    }

    public List<Question> getAllQuestions() {

        Session session =
                HibernateUtil.getSessionFactory().openSession();

        List<Question> list;

        try {

            list = session.createQuery(
                    "FROM Question ORDER BY questionId")
                    .list();

        } finally {

            session.close();
        }

        return list;
    }

    public void delete(int id) {

        Session session =
                HibernateUtil.getSessionFactory().openSession();

        try {

            session.beginTransaction();

            Question question =
                    (Question) session.get(
                            Question.class, id);

            if (question != null) {
                session.delete(question);
            }

            session.getTransaction().commit();

        } finally {

            session.close();
        }
    }
}