/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clase;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import Conexion.Conexion;

/**
 *
 * @author Luis Carcamo
 */
public class Cancha_DB {
        // Traer todo los productos
        public static ArrayList<Cancha> obtenerCanchasHabilitadas(){
            ArrayList<Cancha> lista = new ArrayList<Cancha>();
                Connection cn;
                Conexion con = new Conexion();  
                cn = con.conectar();

                CallableStatement cs = null;
                ResultSet rs = null;

                try{
                    cs=cn.prepareCall("CALL MOSTRAR_CANCHAS_HABILITADAS");
                    rs=cs.executeQuery();
                    while(rs.next()){
                        Cancha c = new Cancha(rs.getString("Codigo_C"), rs.getString("Clase_C"), rs.getString("Suelo_C"), rs.getString("Descripcion_C"), rs.getDouble("Precio_C"), rs.getString("Imagen_C"), rs.getString("Estado_C"));
                        lista.add(c);
                    }

                }catch(Exception e){
                    System.out.println(e);
                }

            return lista;
        }
    
    public static ArrayList<Cancha> obtenerCanchasInhabilitadas(){
        ArrayList<Cancha> lista = new ArrayList<Cancha>();
            Connection cn;
            Conexion con = new Conexion();
            cn = con.conectar();
            
            CallableStatement cs = null;
            ResultSet rs = null;
            
            try{
                cs=cn.prepareCall("CALL MOSTRAR_CANCHAS_ELIMINADAS");
                rs=cs.executeQuery();
                while(rs.next()){
                    Cancha c = new Cancha(rs.getString("Codigo_C"), rs.getString("Clase_C") , rs.getString("Marca_C"), rs.getString("Descripcion_C"), rs.getDouble("Precio_C"), rs.getString("Imagen_C"), rs.getString("Estado_C"));
                    lista.add(c);
                }
                
            }catch(Exception e){
                System.out.println(e);
            }
            
        return lista;
    }
    

    
    public static boolean actualizarCancha(Cancha c){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MODIFICAR_CANCHA(?,?,?,?,?,?)");
            cs.setString(1, c.getCodigoC());
            cs.setString(2, c.getClaseCancha());
            cs.setString(3, c.getSueloCancha());
            cs.setString(4, c.getDescripcion());
            cs.setDouble(5, c.getPrecioC());
            cs.setString(6, c.getImagenC());
            cs.executeUpdate();
            
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static boolean eliminarCancha(Cancha c){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL ELIMINAR_CANCHA (?)");
            cs.setString(1, c.getCodigoC());

            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static boolean recuperarCancha(Cancha c){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL RECUPERAR_CANCHA (?)");
            cs.setString(1, c.getCodigoC());
            
            int i = cs.executeUpdate();
            
            if(i==1){
                resp = true;
            }else{
                resp = false;}
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static Cancha listarCanchaPorCodigo(String Codigo){
        Cancha c = new Cancha();
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL BUSCAR_CANCHA_CODIGO (?)");
            cs.setString(1, Codigo);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                c.setCodigoC(rs.getString("Codigo_C"));
                c.setClaseCancha(rs.getString("Nombre_CC"));
                c.setSueloCancha(rs.getString("Nombre_SC"));
                c.setDescripcion(rs.getString("Descripcion_C"));
                c.setPrecioC(rs.getDouble("Precio_C"));
                c.setImagenC(rs.getString("Imagen_C")); 
            }
        }catch(Exception e){System.out.println(e);}
        return c;
    }
    
}
