package dao;

import model.Admin;
import org.hibernate.Session;
import util.HibernateUtil;

public class AdminDAO {

    public Admin login(String username, String password) {

        Session session =
                HibernateUtil.getSessionFactory().openSession();

        Admin admin = null;

        try {

            admin = (Admin) session.createQuery(
                    "FROM Admin WHERE username = :u AND password = :p")
                    .setParameter("u", username)
                    .setParameter("p", password)
                    .uniqueResult();

        } finally {

            session.close();
        }

        return admin;
    }

    public void save(Admin admin) {

        Session session =
                HibernateUtil.getSessionFactory().openSession();

        try {

            session.beginTransaction();

            session.save(admin);

            session.getTransaction().commit();

        } finally {

            session.close();
        }
    }
}