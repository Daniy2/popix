package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

import static model.Utility.errorConn;
import static model.Utility.errorConnUpdate;

public class PersonalInfoDao implements PersonalInfoInterface{

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

    private static final String Table_Name = "personalinfo";


    @Override
    public void doSave(PersonalInfoBean personalInfoBean, String email) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        String insertSql = "INSERT INTO "+Table_Name+" (Customer,Name,Surname,Date_of_Birth,Cellphone_number)" +
                "VALUES (?,?,?,?,?)";

        try{
            con = ds.getConnection();
            con.setAutoCommit(false);
            preparedStatement = con.prepareStatement(insertSql);

            preparedStatement.setString(1,email);
            preparedStatement.setString(2, personalInfoBean.getName());
            preparedStatement.setString(3,personalInfoBean.getSurname());
            preparedStatement.setDate(4, (Date) personalInfoBean.getBirth_date());
            preparedStatement.setString(5,personalInfoBean.getPhone());

            preparedStatement.executeUpdate();
            con.commit();

        }catch (SQLException e) {
            try{
                if(con!=null)
                    con.rollback();
            }catch (SQLException ex){
                throw new RuntimeException("Errore durrante rollback",ex);
            }
            throw new RuntimeException("Errore durante transazione sql",e);
        }finally {
            errorConnUpdate(con, preparedStatement);
        }

    }

    @Override
    public PersonalInfoBean getPersonalInfo(String email) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        PersonalInfoBean personalInfoBean = null;
        ResultSet resultSet = null;

        String selectSql = "SELECT personalinfo.Customer, personalinfo.Name, personalinfo.Surname, " +
                "personalinfo.Date_of_Birth, personalinfo.Cellphone_number " +
                "FROM personalinfo INNER JOIN user ON personalinfo.Customer = user.Email " +
                "WHERE User.Email = ?";
        try {
            con = ds.getConnection();
            preparedStatement = con.prepareStatement(selectSql);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                personalInfoBean = new PersonalInfoBean();
                personalInfoBean.setName(resultSet.getString("Name"));
                personalInfoBean.setCustomer(resultSet.getString("Customer"));
                personalInfoBean.setSurname(resultSet.getString("Surname"));
                personalInfoBean.setBirth_date(resultSet.getDate("Date_of_Birh"));
                personalInfoBean.setPhone(resultSet.getString("Cellphone_number"));

            }
        }catch(SQLException e){
                throw new RuntimeException("Errore durante l'esecuzione della query SQL", e);
            } finally{
                errorConn(con, preparedStatement, resultSet);
            }
        return personalInfoBean;
    }
}
