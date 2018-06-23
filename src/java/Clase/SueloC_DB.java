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
public class SueloC_DB {
        public static ArrayList<SueloC> obtenerSCHabilitadas(){
        ArrayList<SueloC> lista = new ArrayList<SueloC>();
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_SUELO_CANCHAS_HABILITADAS");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                SueloC SC = new SueloC(rs.getString("Codigo_SC"), rs.getString("Nombre_SC"), rs.getString("Estado_SC"));
                lista.add(SC);
            }
            
        }catch(Exception e){
            System.out.println(e);
        }
        return lista;
    }
    
    public static ArrayList<SueloC> obtenerMVInhabilitados(){
        ArrayList<SueloC> lista = new ArrayList<SueloC>();
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_SUELO_CANCHAS_INHABILITADAS");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                SueloC SC = new SueloC(rs.getString("Codigo_SC"), rs.getString("Nombre_SC"), rs.getString("Estado_SC"));
                lista.add(SC);
            }
            
        }catch(Exception e){
            System.out.println(e);
        }
        return lista;
    }
    
    public static boolean insertarSueloCancha(SueloC sc){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL REGISTRAR_SUELO_CANCHA (?)");
            cs.setString(1, sc.getNombreSC());
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static boolean actualizarSueloCancha(SueloC sc){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MODIFICAR_SUELO_CANCHA (?,?)");
            cs.setString(1, sc.getCodigoSC());
            cs.setString(2, sc.getNombreSC()); 
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static boolean eliminarSueloCancha(SueloC sc){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL ELIMINAR_SUELO_CANCHA (?)");
            cs.setString(1, sc.getCodigoSC());
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static boolean recuperarSueloCancha(SueloC sc){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL RECUPERAR_SUELO_CANCHA (?)");
            cs.setString(1, sc.getCodigoSC());
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
}
