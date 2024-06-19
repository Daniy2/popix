package model;

import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Utility {
    public static String hashPassword(String password) {
        int costFactor = 12;
        String salt = BCrypt.gensalt(costFactor);
        return BCrypt.hashpw(password, salt);
    }

    public static boolean checkPassword(String password, String hashedPassword) {
        return BCrypt.checkpw(password, hashedPassword);
    }

    public static void errorConn(Connection con, PreparedStatement preparedStatement, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            throw new RuntimeException("Errore durante la chiusura delle risorse", ex);
        }
    }

       public static void errorConnUpdate(Connection con, PreparedStatement preparedStatement) {
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
    public static void Fillproduct(ResultSet resultSet, ProductBean productBean) throws SQLException {
        productBean.setId(resultSet.getString("IdProduct"));
        productBean.setName(resultSet.getString("Name"));
        productBean.setDescription(resultSet.getString("Description"));
        productBean.setPrice(resultSet.getDouble("Cost"));
        productBean.setQuantity(resultSet.getInt("Pieces_in_stock"));
        productBean.setImage(resultSet.getBlob("Image_src"));
        productBean.setBrand(resultSet.getString("Brand"));
        productBean.setFigure(resultSet.getString("Figure"));
    }
}
