/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg;

/**
 *
 * @author admin pc
 */
import java.sql.*;
public class MyCon {
    public Connection tcon()
    {
        Connection c=null;
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        c=DriverManager.getConnection("jdbc:mysql://localhost:3307/citylife","root","root");
        
        }
        catch(Exception e){
        System.out.println(e);
        }
    return c;
    }
   
}
