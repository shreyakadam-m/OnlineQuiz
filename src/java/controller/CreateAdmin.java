
package controller;

import dao.AdminDAO;
import model.Admin;

public class CreateAdmin {

    public static void main(String[] args) {

        Admin admin = new Admin();

        admin.setUsername("admin");
        admin.setPassword("admin123");

        AdminDAO dao = new AdminDAO();
        dao.save(admin);

        System.out.println("Admin created successfully!");
    }
}
