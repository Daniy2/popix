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
import static model.Utility.errorConnUpdate;

public class OrderDetailsDao implements OrderDetailsInterface{

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

    private static final String TABLE_NAME = "orderdetails";

    @Override
    public ArrayList<OrderDetailsBean> retrieveOrderDetails(String email) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<OrderDetailsBean> orderDetailsBeans = new ArrayList<>();
        String selectSql = "SELECT " +
                TABLE_NAME +".Price"+
                TABLE_NAME + ".idProduct"+
                "u.Username, " +
                "o.Date, " +
                "od.Quantity, " +
                "o.IdOrder, " +
                "o.Subtotal, " +
                "p.Brand " +
                "FROM Ord o " +
                "JOIN User u ON o.Customer = u.Email " +
                "JOIN " + TABLE_NAME + " od ON o.IdOrder = od.IdOrder " +
                "JOIN Product p ON od.IdProduct = p.IdProduct " +
                "WHERE u.Email = ?";

        try{
            con = ds.getConnection();
            ps = con.prepareStatement(selectSql);
            ps.setString(1,email);
            while(rs.next()){
                OrderDetailsBean bean = new OrderDetailsBean();

                bean.setOrderId(rs.getInt("o.idOrder"));
                bean.setQuantity(rs.getInt("od.Quantity"));
                String idProd = rs.getString("orderdetails.idProduct");
                ProductDao productDao = new ProductDao();
                ProductBean productBean = productDao.retrieveProduct(idProd);
                bean.setProductBean(productBean);
                bean.setPrice(rs.getDouble("orderdetails.Price"));
                orderDetailsBeans.add(bean);

            }
        }catch (SQLException e) {
            throw new RuntimeException("Errore durante l'esecuzione della query SQL", e);
        } finally {
            errorConn(con, ps, rs);
        }

        return orderDetailsBeans;
    }

    @Override
    public void updateOrderDetails(OrderDetailsBean orderDetails) {
        Connection con = null;
        PreparedStatement ps = null;
        String insertSql = "INSERT INTO " + TABLE_NAME + "(idOrder,idProduct,Quantity,Price) VALUES (?,?,?,?)";

        try{
            con = ds.getConnection();
            con.setAutoCommit(false);
            ps = con.prepareStatement(insertSql);
            ps.setInt(1,orderDetails.getOrderId());
            ps.setString(2, orderDetails.getProductBean().getId());
            ps.setInt(3, orderDetails.getQuantity());
            ps.setDouble(4, orderDetails.getPrice());
            ps.executeUpdate();
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
            errorConnUpdate(con, ps);
        }

    }
}
