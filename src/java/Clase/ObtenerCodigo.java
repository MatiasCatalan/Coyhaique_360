/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clase;
import java.sql.*;
import Conexion.Conexion;
/**
 *
 * @author Luis Carcamo
 */
public class ObtenerCodigo {
        public static String CodigoCancha(){
        String Codigo = "";
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_CODIGO_CANCHA");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Codigo = rs.getString("Codigo_C");
            }
        }catch(Exception e){
           System.out.println(e);
        }
        return Codigo;
    }
    
    public static String CodigoSueloCancha(){
        String Codigo = "";
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_CODIGO_SUELO_CANCHA");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Codigo = rs.getString("Codigo_SC");
            }
        }catch(Exception e){
           System.out.println(e);
        }
        return Codigo;
    }
    
    public static String CodigoClaseCancha(){
        String Codigo = "";
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_CODIGO_CLASE_CANCHA");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Codigo = rs.getString("Codigo_CC");
            }
        }catch(Exception e){
           System.out.println(e);
        }
        return Codigo;
    }
    
    public static String CodigoArriendo(){
        String Codigo = "";
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_CODIGO_ARRIENDO");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Codigo = rs.getString("Codigo_A");
            }
        }catch(Exception e){
           System.out.println(e);
        }
        return Codigo;
    }
}
