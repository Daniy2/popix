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

import static model.Utility.*;

public class ProductDao implements ProductInterface{

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

    private static final String Table_Name = "product";


    @Override
    public void doSave(ProductBean productBean) {
        Connection con = null;
        PreparedStatement preparedStatement = null;

        String insertSql = "INSERT INTO "+Table_Name+" (idProduct,Name,Description,Cost,Pieces_in_stock,Image_src,Brand,Figure)" +
                "VALUES (?,?,?,?,?,?,?,?)";
        try{
            con = ds.getConnection();
            con.setAutoCommit(false);
            preparedStatement = con.prepareStatement(insertSql);

            preparedStatement.setString(1,productBean.getId());
            preparedStatement.setString(2,productBean.getName());
            preparedStatement.setString(3,productBean.getDescription());
            preparedStatement.setDouble(4,productBean.getPrice());
            preparedStatement.setInt(5,productBean.getQuantity());
            preparedStatement.setBlob(6,productBean.getImage());
            preparedStatement.setString(7,productBean.getBrand());
            preparedStatement.setString(8,productBean.getFigure());

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
    public ProductBean retrieveProduct(String productId) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ProductBean productBean = null;

        String selectSql = "SELECT * FROM "+Table_Name+" WHERE idProduct=?";

        try{
            con = ds.getConnection();
            preparedStatement = con.prepareStatement(selectSql);
            preparedStatement.setString(1,productId);

            resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                productBean = new ProductBean();
                Fillproduct(resultSet, productBean);
            }
        }catch (SQLException e) {
            throw new RuntimeException("Errore durante l'esecuzione della query SQL", e);
        } finally {
            errorConn(con, preparedStatement, resultSet);
        }

        return productBean;
    }



    @Override
    public ArrayList<ProductBean> retrieveAllProducts() {
        ArrayList<ProductBean> productBeans = new ArrayList<>();
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String selectSql = "SELECT * FROM "+Table_Name;

        try{
            con = ds.getConnection();
            preparedStatement = con.prepareStatement(selectSql);

            resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                ProductBean productBean = new ProductBean();
                Fillproduct(resultSet, productBean);
            }
        }catch (SQLException e) {
            throw new RuntimeException("Errore durante l'esecuzione della query SQL", e);
        } finally {
            errorConn(con, preparedStatement, resultSet);
        }

        return productBeans;
    }

    @Override
    public ArrayList<ProductBean> retrieveAllProductsByBrand(String brand) {
        ArrayList<ProductBean> productBeans = new ArrayList<>();
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String selectSql = "SELECT * FROM "+Table_Name+" WHERE Brand = ?";

        try{
            con = ds.getConnection();
            preparedStatement = con.prepareStatement(selectSql);
            preparedStatement.setString(1,brand);

            resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                ProductBean productBean = new ProductBean();
                Fillproduct(resultSet, productBean);
            }
        }catch (SQLException e) {
            throw new RuntimeException("Errore durante l'esecuzione della query SQL", e);
        } finally {
            errorConn(con, preparedStatement, resultSet);
        }

        return productBeans;
    }

    @Override
    public ArrayList<ProductBean> retrieveAllProductsByFigure(String figure) {
        ArrayList<ProductBean> productBeans = new ArrayList<>();
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String selectSql = "SELECT * FROM "+Table_Name+" WHERE Figure = ?";

        try{
            con = ds.getConnection();
            preparedStatement = con.prepareStatement(selectSql);
            preparedStatement.setString(1,figure);

            resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                ProductBean productBean = new ProductBean();
                Fillproduct(resultSet, productBean);
            }
        }catch (SQLException e) {
            throw new RuntimeException("Errore durante l'esecuzione della query SQL", e);
        } finally {
            errorConn(con, preparedStatement, resultSet);
        }

        return productBeans;
    }

    @Override
    public ArrayList<ProductBean> retrieveAllProductsByPrice() {
        ArrayList<ProductBean> productBeans = new ArrayList<>();
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String selectSql = "SELECT * FROM "+Table_Name+" ORDER BY Cost";

        try{
            con = ds.getConnection();
            preparedStatement = con.prepareStatement(selectSql);

            resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                ProductBean productBean = new ProductBean();
                Fillproduct(resultSet, productBean);
            }
        }catch (SQLException e) {
            throw new RuntimeException("Errore durante l'esecuzione della query SQL", e);
        } finally {
            errorConn(con, preparedStatement, resultSet);
        }

        return productBeans;
    }
}
