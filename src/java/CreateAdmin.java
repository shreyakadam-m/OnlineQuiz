package util;

import model.Admin;
import org.hibernate.Session;

public class CreateAdmin {

    public static void main(String[] args) {

        Session session =
                HibernateUtil.getSessionFactory()
                .openSession();

        try {

            session.beginTransaction();

            Admin admin = new Admin();

            admin.setUsername("admin");

            admin.setPassword("admin123");

            session.save(admin);

            session.getTransaction().commit();

            System.out.println(
                    "Admin created successfully!");

        } catch(Exception e) {

            e.printStackTrace();

        } finally {

            session.close();

        }
    }
}
