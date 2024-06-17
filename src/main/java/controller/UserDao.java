package controller;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

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
            //da fare hashing
            preparedStatement.setString(3,user.getPassword());
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
        return null;
    }

    @Override
    public ArrayList<UserBean> retrieveAllUsers() {
        return null;
    }
}
