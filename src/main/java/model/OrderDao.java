package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

import static model.Utility.errorConn;
import static model.Utility.errorConnUpdate;

public class OrderDao implements OrderInterface{

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

    private static final String TABLE_NAME = "ord";
    @Override
    public void doSave(OrderBean order) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        String inserSql = "INSERT INTO " + TABLE_NAME + " (Date, Subtotal, Status, Customer) VALUES (?,?,?,?)";
        try{
            con = ds.getConnection();
            con.setAutoCommit(false);
            preparedStatement = con.prepareStatement(inserSql);

            preparedStatement.setDate(1,order.getOrderDate());
            preparedStatement.setDouble(2,order.getSubtotal());
            preparedStatement.setString(3, order.getStatus());
            preparedStatement.setString(4,order.getCustomer());

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
    public ArrayList<OrderBean> getOrders() {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<OrderBean> orders = new ArrayList<>();

        String selectSql = "SELECT " +
                "u.Username, " +
                TABLE_NAME + ".Date, " +
                TABLE_NAME + ".IdOrder, " +
                "od.IdProduct, " +
                TABLE_NAME + ".Subtotal, " +
                TABLE_NAME + ".Status " +
                "FROM " + TABLE_NAME + " " +
                "JOIN User u ON " + TABLE_NAME + ".Customer = u.Email " +
                "JOIN OrderDetails od ON " + TABLE_NAME + ".IdOrder = od.IdOrder";

        try{
            con = ds.getConnection();
            preparedStatement = con.prepareStatement(selectSql);
            resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                OrderBean order = new OrderBean();
                order.setOrderDate(resultSet.getDate("ord.Date"));
                order.setCustomer(resultSet.getString("u.Username"));
                order.setCustomer(resultSet.getString("ord.Status"));
                order.setIdOrd(resultSet.getInt("ord.idOrder"));
                order.setSubtotal(resultSet.getDouble("ord.Subtotal"));
                orders.add(order);
            }
        }catch (SQLException e) {
            throw new RuntimeException("Errore durante l'esecuzione della query SQL", e);
        } finally {
            errorConn(con, preparedStatement, resultSet);
        }
        return orders;
    }

    @Override
    public ArrayList<OrderBean> getOrdersSorted(Date from, Date to) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<OrderBean> orders = new ArrayList<>();

        String selectSql = "SELECT " +
                "u.Username, " +
                TABLE_NAME + ".Date, " +
                TABLE_NAME + ".IdOrder, " +
                "od.IdProduct, " +
                TABLE_NAME + ".Subtotal, " +
                TABLE_NAME + ".Status " +
                "FROM " + TABLE_NAME + " " +
                "JOIN User u ON " + TABLE_NAME + ".Customer = u.Email " +
                "JOIN OrderDetails od ON " + TABLE_NAME + ".IdOrder = od.IdOrder "+
                "WHERE " + TABLE_NAME + ".Date BETWEEN ? AND ?";;

        try{
            con = ds.getConnection();
            preparedStatement = con.prepareStatement(selectSql);
            preparedStatement.setDate(1,from);
            preparedStatement.setDate(2,to);
            resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                OrderBean order = new OrderBean();
                order.setOrderDate(resultSet.getDate("ord.Date"));
                order.setCustomer(resultSet.getString("u.Username"));
                order.setCustomer(resultSet.getString("ord.Status"));
                order.setIdOrd(resultSet.getInt("ord.idOrder"));
                order.setSubtotal(resultSet.getDouble("ord.Subtotal"));
                orders.add(order);
            }
        }catch (SQLException e) {
            throw new RuntimeException("Errore durante l'esecuzione della query SQL", e);
        } finally {
            errorConn(con, preparedStatement, resultSet);
        }
        return orders;
    }

    public int getOrderId() {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int lastId = 0;

        try {
            con = ds.getConnection();
            String sql = "SELECT LAST_INSERT_ID() AS last_id";

            preparedStatement = con.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                lastId = resultSet.getInt("last_id");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Errore durante il recupero dell'ultimo ID dell'ordine", e);
        } finally {
            errorConn(con, preparedStatement, resultSet);
        }

        return lastId;
    }

}
