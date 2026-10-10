package dao;

import model.Result;
import org.hibernate.Session;
import util.HibernateUtil;

import java.util.List;

public class ResultDAO {

    public void save(Result result) {

        Session session =
                HibernateUtil.getSessionFactory().openSession();

        try {

            session.beginTransaction();

            session.save(result);

            session.getTransaction().commit();

        } finally {

            session.close();
        }
    }

    public List<Result> getAllResults() {

        Session session =
                HibernateUtil.getSessionFactory().openSession();

        List<Result> list;

        try {

            list = session.createQuery(
                    "FROM Result ORDER BY resultId DESC")
                    .list();

        } finally {

            session.close();
        }

        return list;
    }
}