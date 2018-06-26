/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Conexion.Conexion;
import Clase.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Luis Carcamo Espinoza
 */
public class Servlet_Arriendo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String accion = request.getParameter("accion");
            
            if(accion.equals("RegistrarArriendo")){
                this.RegistrarArriendo(request, response); 
            }
            if(accion.equals("MostrarDetalle")){
                this.MostrarDetalleArriendo(request, response); 
            }
            if(accion.equals("EliminaArriendo")){
                this.EliminarArriendo(request, response); 
            }
            if(accion.equals("quitar")){
                this.QuitarProducto(request, response); 
            }
        }
    }
    
    private void RegistrarArriendo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        ArrayList lista = (ArrayList)session.getAttribute("carrito");
        
        DecimalFormat df = new DecimalFormat("0.00");
        DecimalFormatSymbols dfs = df.getDecimalFormatSymbols();
        dfs.setDecimalSeparator('.');
        df.setDecimalFormatSymbols(dfs);
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        Arriendo a = new Arriendo();
        a.setCliente(request.getParameter("txtCliente")); 
        a.setTotal(Double.parseDouble(request.getParameter("txtTotal")));
        
        boolean resp = Arriendo_DB.insertarArriendo(a);
        
        if(resp){
            // i detalle vemta
            String CodigoArriendo = request.getParameter("txtCodigoA");
            String NombreCancha[] = request.getParameterValues("nombreCancha");
            String PrecioCancha[] = request.getParameterValues("precioCancha");
            String CantidadCancha[] = request.getParameterValues("cantidadCancha");
            String DescuentoCancha[] = request.getParameterValues("descuentoCancha");
            String SubTotalCancha[] = request.getParameterValues("subTotalCancha");
            
            if("null".equals(CodigoArriendo)){
                CodigoArriendo = "V0001";
            }
            
            for(int i=0; i<NombreCancha.length;i++){
                try{
                    CallableStatement cs = cn.prepareCall("CALL REGISTRAR_DETALLE_ARRIENDO (?,?,?,?,?,?)");
                    cs.setString(1, CodigoArriendo);
                    cs.setString(2, NombreCancha[i]);
                    cs.setString(3, PrecioCancha[i]);
                    cs.setString(4, CantidadCancha[i]);
                    cs.setString(5, DescuentoCancha[i]);
                    cs.setString(6, SubTotalCancha[i]);
                    int j = cs.executeUpdate();
                    if(j==1){
                        response.sendRedirect("mensaje2.jsp?mens='Se ha registrado su Arriendo correctamente'"); 
                        lista.clear();
                    }else{
                        response.sendRedirect("mensaje2.jsp?mens='Error al registrar su Arriendo'");
                      
                        
                    }
                }catch(Exception e){System.out.println(e);}
            }
        }else{
            response.sendRedirect("mensaje2.jsp?mens='Error al registrar su Arriendo  "
                    + "Por favor Inicie Sesion'");
        }
    }
    
    private void MostrarDetalleArriendo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        request.getSession().setAttribute("CodigoArriendo", request.getParameter("codigoA"));
        request.getSession().setAttribute("Cliente", request.getParameter("cliente"));
        request.getSession().setAttribute("Importe", request.getParameter("importe"));
        request.getSession().setAttribute("FechaArriendo", request.getParameter("FechaA")); 
        request.getSession().setAttribute("CodigoCliente", request.getParameter("codigoCli")); 
        

        response.sendRedirect("MostrarDetalleArriendo.jsp"); 
    }
    
    
    private void QuitarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false); 
        
        int numeroVenta = Integer.parseInt(request.getParameter("numero"));
        ArrayList lista = (ArrayList)session.getAttribute("carrito");
        lista.remove(numeroVenta - 1); 
        response.sendRedirect("RegistrarArriendo.jsp"); 
    }
    
    private void EliminarArriendo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        Arriendo a = new Arriendo();
        a.setCodigoArriendo(request.getParameter("codigoA"));
        boolean resp = Arriendo_DB.eliminarArriendo(a);
        
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha eliminado el Arriendo correctamente "+ a.getCodigoArriendo() +"'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al eliminar El Arriendo " +a.getCodigoArriendo()+ "'"); 
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
