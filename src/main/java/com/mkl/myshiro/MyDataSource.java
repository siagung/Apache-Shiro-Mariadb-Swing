package com.mkl.myshiro;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

/**
 *
 * @author zakaria
 */
public class MyDataSource{

    private static final long serialVersionUID = -2248923051363839327L;
    
    public static String driverclassname;
    //public static String datasourceclassName;
    public static String url;
    public static String username;
    public static String password;
    private static HikariConfig config = new HikariConfig();
    private static HikariDataSource ds;
    
    
      private static void decryptPassword() throws FileNotFoundException {
        FileInputStream stream = null;
        StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
        encryptor.setPassword("123456789");
        encryptor.setAlgorithm("PBEWITHMD5ANDDES");
        Properties prop = new Properties();
        stream = new FileInputStream(System.getProperty("user.dir").concat(File.separator).concat("bin")+ File.separator + "config.properties");
        try {
            prop.load(stream);
            driverclassname = prop.getProperty("jdbc.driverclassname");
            //datasourceclassName = prop.getProperty("jdbc.datasourceclassname");
            url = prop.getProperty("jdbc.url") + "?useUnicode=yes&characterEncoding=UTF-8&useSSL=false";
            username = prop.getProperty("jdbc.username");
            password = encryptor.decrypt(prop.getProperty("jdbc.password"));
        } catch (IOException ex) {
            //eat all error
        } finally {
            try {
                stream.close();
            } catch (IOException ex) {
                System.err.println(ex);
            }
        }
    }

    
    public static HikariDataSource getDataSource() throws FileNotFoundException {
        decryptPassword();
        config.setJdbcUrl(url);
        config.setUsername(username);
        config.setPassword(password);
        config.setDriverClassName(driverclassname);
        /*
        config.setDriverClassName(driverclassname);
        config.setMaximumPoolSize(20);
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", 250);
        config.addDataSourceProperty("prepStmtCacheSqlLimit", 2048);
        */
        config.addDataSourceProperty("useJDBCCompliantTimezoneShift", "true");
        config.addDataSourceProperty("useLegacyDatetimeCode", "false");
        config.addDataSourceProperty("serverTimezone", "UTC");
        config.addDataSourceProperty("maximumPoolSize", 20);
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", 250);
        config.addDataSourceProperty("prepStmtCacheSqlLimit", 2048);
        ds = new HikariDataSource(config);
        return ds;
    }

    public static void closeConnection() {
        ds.close();
    }


}
