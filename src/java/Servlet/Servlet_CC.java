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
import Clase.*;



/**
 *
 * @author Luis Carcamo
 */
public class Servlet_CC extends HttpServlet {

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
            if(accion.equals("insertar")){
                this.RegistrarClaseCancha(request, response);
            }
            if(accion.equals("actualizar")){
                this.ActualizarClaseCancha(request, response); 
            }
            if(accion.equals("eliminar")){
                this.EliminarClaseCancha(request, response); 
            }
            if(accion.equals("recuperar")){
                this.RecuperarClaseCancha(request, response); 
            }
            
        }
    }
              private void RegistrarClaseCancha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        ClaseC cc = new ClaseC();
        cc.setNombreCC(request.getParameter("txtNombre")); 
        
        boolean resp = ClaseC_DB.insertarClaseCancha(cc);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha registrado una Clase de Cancha correctamente'");
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al registrar una Clase de Cancha'"); 
        }
    }
    
    private void ActualizarClaseCancha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        ClaseC cc = new ClaseC();
        cc.setCodigoCC(request.getParameter("txtCodigo"));
        cc.setNombreCC(request.getParameter("txtNombre")); 
        
        boolean resp = ClaseC_DB.actualizarClaseCancha(cc);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha modificado la clase Cancha "+cc.getCodigoCC()+"'");
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al actualizar la clase Cancha'");
        }
    }
    
    private void EliminarClaseCancha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        ClaseC cc = new ClaseC();
        cc.setCodigoCC(request.getParameter("codigoCC"));
        
        boolean resp = ClaseC_DB.darBajaClaseCancha(cc);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha eliminado la clase Cancha "+cc.getCodigoCC()+"'");
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al eliminar la clase Cancha'");
        }
    }
    
    private void RecuperarClaseCancha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        ClaseC cc = new ClaseC();
        cc.setCodigoCC(request.getParameter("codigoCC"));
        
        boolean resp = ClaseC_DB.darAltaClaseCancha(cc);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha recuperado la clase Cancha "+cc.getCodigoCC()+"'");
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al recuperar la clase Cancha'");
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
