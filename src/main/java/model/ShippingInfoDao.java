package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static model.Utility.errorConn;

public class ShippingInfoDao implements ShippingInfoInterface{

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

    private static final String Table_Name = "shippinginfo";

    @Override
    public void doSave(ShippingInfoBean shippingInfoBean, String email) {
        Connection con = null;
        PreparedStatement preparedStatement = null;

        String insertSql = "INSERT INTO "+ Table_Name+" (Customer, Country, City, Address) " +
                " VALUES (?,?,?,?)";

        try {
            con = ds.getConnection();
            con.setAutoCommit(false);

            preparedStatement = con.prepareStatement(insertSql);
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,shippingInfoBean.getCountry());
            preparedStatement.setString(3,shippingInfoBean.getCity());
            preparedStatement.setString(4,shippingInfoBean.getAddress());

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
            Utility.errorConnUpdate(con, preparedStatement);
        }
    }

    @Override
    public ShippingInfoBean retrieveShippingInfo(String email) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ShippingInfoBean shippingInfoBean = null;
        ResultSet resultSet = null;

        String selectSql = "SELECT shippinginfo.Customer, shippinginfo.Country, " +
                "shippinginfo.City, shippinginfo.Address " +
                "FROM " + Table_Name + " "+
                "INNER JOIN user ON shippinginfo.Customer = user.Email " +
                "WHERE user.Email = ?";

        try{
            con = ds.getConnection();
            preparedStatement = con.prepareStatement(selectSql);
            preparedStatement.setString(1,email);
            resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                shippingInfoBean = new ShippingInfoBean();
                shippingInfoBean.setCustomer(email);
                shippingInfoBean.setAddress(resultSet.getString("Addres"));
                shippingInfoBean.setCity(resultSet.getString("City"));
                shippingInfoBean.setCountry(resultSet.getString("Country"));

            }

        }catch(SQLException e){
            throw new RuntimeException("Errore durante l'esecuzione della query SQL", e);
        } finally{
            errorConn(con, preparedStatement, resultSet);
        }

        return shippingInfoBean;

    }
}
