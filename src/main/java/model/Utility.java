package model;

import org.mindrot.jbcrypt.BCrypt;

public class Utility {
    public static String hashPassword(String password) {
        int costFactor = 12;
        String salt = BCrypt.gensalt(costFactor);
        return BCrypt.hashpw(password, salt);
    }

    public static boolean checkPassword(String password, String hashedPassword) {
        return BCrypt.checkpw(password, hashedPassword);
    }
}
