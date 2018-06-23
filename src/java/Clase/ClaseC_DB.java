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
public class ClaseC_DB {
        public static ArrayList<ClaseC> ObtenerCCHabilitadas(){
        ArrayList<ClaseC> lista = new ArrayList<ClaseC>();
        Connection cn;
        Conexion con = new Conexion();
        cn=con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_CLASE_CANCHAS_HABILITADAS");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                ClaseC cc = new ClaseC(rs.getString("Codigo_CC"), rs.getString("Nombre_CC"), rs.getString("Estado_CC"));
                lista.add(cc);
            }
        }catch(Exception e){ 
            System.out.println(e);
        }
        return lista;
    }
    
    public static ArrayList<ClaseC> obtenerCCInhabilitadas(){
        ArrayList<ClaseC> lista = new ArrayList<ClaseC>();
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_CLASE_CANCHAS_INHABILITADAS");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                ClaseC CC = new ClaseC(rs.getString("Codigo_CC"), rs.getString("Nombre_CC"), rs.getString("Estado_CC"));
                lista.add(CC);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return lista;
    } 
    
    public static boolean insertarClaseCancha(ClaseC cc){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL REGISTRAR_CLASE_CANCHA (?)");
            cs.setString(1, cc.getNombreCC());
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static boolean actualizarClaseCancha(ClaseC cc){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MODIFICAR_CLASE_CANCHA (?,?)");
            cs.setString(1, cc.getCodigoCC());
            cs.setString(2, cc.getNombreCC()); 
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static boolean darBajaClaseCancha(ClaseC cc){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL ELIMINAR_CLASE_CANCHA (?)");
            cs.setString(1, cc.getCodigoCC()); 
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static boolean darAltaClaseCancha(ClaseC cc){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL RECUPERAR_CLASE_CANCHA (?)");
            cs.setString(1, cc.getCodigoCC()); 
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    
    
}
