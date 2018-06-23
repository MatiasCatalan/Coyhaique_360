/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clase;

import Conexion.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import Conexion.Conexion;

/**
 *
 * @author Luis Carcamo
 */
public class Arriendo_DB {
        public static boolean insertarArriendo (Arriendo a){
        boolean resp = false;
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL REGISTRAR_ARRIENDO (?,?)");
            cs.setString(1, a.getCliente());
            cs.setDouble(2, a.getTotal());
            int i = cs.executeUpdate();
            
            if(i == 1){
                resp = true;
            }else{
                resp = false;
            }
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static ArrayList<Arriendo> ObtenerArriendo(){
        ArrayList<Arriendo> lista = new ArrayList<Arriendo>();
        Connection cn;
        Conexion con = new Conexion();
        cn=con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_ARRIENDO");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Arriendo a = new Arriendo();
                a.setCodigoArriendo(rs.getString("Codigo_A"));
                a.setCodigoCliente(rs.getString("Codigo_U")); 
                a.setCliente(rs.getString("CLIENTE"));
                a.setTotal(rs.getDouble("Total")); 
                a.setFecha(rs.getString("Fecha")); 
                lista.add(a);
            } 
        }catch(Exception e){
            System.out.println(e);
        }
        return lista;
    }
    
    public static boolean eliminarArriendo(Arriendo a){
        boolean resp = false;
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL ELIMINAR_ARRIENDO (?)");
            cs.setString(1, a.getCodigoArriendo());
            int i = cs.executeUpdate();
            
            if(i == 1){
                resp = true;
            }else{
                resp = false;
            }
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
}
