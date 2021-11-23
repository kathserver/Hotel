/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.DriverManager;
import java.sql.Connection;

/**
 *
 * @author kathy Meza
 */
public class Conexion {
    
   	Connection con;
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="hotel";
	String pass="mihotel";

	public Connection conectar(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(url,user,pass);
		}catch (Exception e){
		}
	return con;
	}
}