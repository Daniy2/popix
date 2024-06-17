package model;

import java.util.ArrayList;

public interface UserInterface {
    void doSave(UserBean user);
    UserBean retrieveUser(String username, String password);
    ArrayList<UserBean> retrieveAllUsers();
}
