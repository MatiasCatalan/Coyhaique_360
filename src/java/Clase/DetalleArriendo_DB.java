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
public class DetalleArriendo_DB {
    
        public static ArrayList<DetalleArriendo> obtenerDetalleArriendo(String CodigoArriendo){
        ArrayList<DetalleArriendo> lista = new ArrayList<DetalleArriendo>();
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_DETALLE_ARRIENDO_POR_CODIGO (?)");
            cs.setString(1, CodigoArriendo);
            ResultSet rs = cs.executeQuery();
            
            while(rs.next()){
                DetalleArriendo da = new DetalleArriendo();
                da.setCodigoArriendo(rs.getString("Codigo_A"));
                da.setNombreCancha(rs.getString("Cancha"));
                da.setPrecio(rs.getDouble("Precio"));
                da.setCantidad(rs.getDouble("Cantidad"));
                da.setDescuento(rs.getDouble("Descuento"));
                da.setSubTotal(rs.getDouble("SubTotal")); 
                lista.add(da);
            }
        }catch(Exception e){System.out.println(e);}
        return lista;
    }
    
}
