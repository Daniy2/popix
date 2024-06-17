package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static model.Utility.errorConn;

public class UserDao implements UserInterface{

    private static final DataSource ds;

    static {
        try{
            Context ctx = new InitialContext();
            Context env = (Context) ctx.lookup("java:comp/env");

            ds = (DataSource) env.lookup("jdbc/popix");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }

    private static final String Table_Name = "user";


    @Override
    public void doSave(UserBean user) {
        Connection con = null;
        PreparedStatement preparedStatement = null;

        String insertSql = "INSERT INTO "+Table_Name+"(Email,Username,Password,Role) VALUES (?,?,?,?)";

        try {
            con = ds.getConnection();
            con.setAutoCommit(false);
            preparedStatement = con.prepareStatement(insertSql);
            preparedStatement.setString(1,user.getEmail());
            preparedStatement.setString(2,user.getUsername());

            //Hashing password
            String hashedpassword = Utility.hashPassword(user.getPassword());

            preparedStatement.setString(3,hashedpassword);
            preparedStatement.setString(4, String.valueOf(Role.user));

            preparedStatement.executeUpdate();
            con.commit();

        } catch (SQLException e) {
            try{
                if(con!=null)
                    con.rollback();
            }catch (SQLException ex){
                throw new RuntimeException("Errore durrante rollback",ex);
            }
            throw new RuntimeException("Errore durante transazione sql",e);
        }finally {
            try{
                if(preparedStatement!=null){
                    preparedStatement.close();
                }
                if(con!=null){
                    con.setAutoCommit(true);
                    con.close();
                }
            }catch (SQLException ez){
                throw new RuntimeException("Errore durante chiusura delle risorse",ez);
            }
        }
    }

    @Override
    public UserBean retrieveUser(String username, String password) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;

        UserBean user = null;
        String selectSql = "SELECT * FROM " + Table_Name + " WHERE Username=?";

        try {
            con = ds.getConnection();
            preparedStatement = con.prepareStatement(selectSql);
            preparedStatement.setString(1, username);

            rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String hashedpassword = rs.getString("Password");
                if(Utility.checkPassword(password,hashedpassword)){
                    user = new UserBean();
                    user.setUsername(rs.getString("Username"));
                    user.setRole(Role.valueOf(rs.getString("Role")));
                    user.setEmail(rs.getString("Email"));
                    user.setPassword(rs.getString("Password"));
                }else {
                    System.out.println("password sbagliata");
                }

            }

        } catch (SQLException e) {
            throw new RuntimeException("Errore durante l'esecuzione della query SQL", e);
        } finally {
            errorConn(con, preparedStatement, rs);
        }

        return user;
    }




    @Override
    public ArrayList<UserBean> retrieveAllUsers() {
        Connection con = null;
        ArrayList<UserBean> users = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        String selectSql = "SELECT * FROM " + Table_Name;

        try {
            con = ds.getConnection();
            preparedStatement = con.prepareStatement(selectSql);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                UserBean user = new UserBean();
                user.setUsername(rs.getString("Username"));
                user.setRole(Role.valueOf(rs.getString("Role")));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                users.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Errore durante l'esecuzione della query SQL", e);
        } finally {
            errorConn(con, preparedStatement, rs);
        }
        return users;
    }
}
