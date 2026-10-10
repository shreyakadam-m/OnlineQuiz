package dao;

import model.Student;
import org.hibernate.Session;
import util.HibernateUtil;

public class StudentDAO {

    public Student login(String email, String password) {

        Session session =
                HibernateUtil.getSessionFactory().openSession();

        Student student = null;

        try {

            student = (Student) session.createQuery(
                    "FROM Student WHERE email = :e AND password = :p")
                    .setParameter("e", email)
                    .setParameter("p", password)
                    .uniqueResult();

        } finally {

            session.close();
        }

        return student;
    }

    public void save(Student student) {

        Session session =
                HibernateUtil.getSessionFactory().openSession();

        try {

            session.beginTransaction();

            session.save(student);

            session.getTransaction().commit();

        } finally {

            session.close();
        }
    }
}