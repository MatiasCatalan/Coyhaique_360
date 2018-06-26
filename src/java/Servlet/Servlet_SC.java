/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;
import Clase.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luis Carcamo
 */
public class Servlet_SC extends HttpServlet {

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
                this.RegistrarSueloCancha(request, response);
            }
            if(accion.equals("actualizar")){
                this.ActualizarSueloCancha(request, response);
            }
            if(accion.equals("eliminar")){
                this.darBajaSueloCancha(request, response);
            }
            
        }
    }
        private void RegistrarSueloCancha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SueloC sc = new SueloC();
        sc.setNombreSC(request.getParameter("txtNombre"));
        
        boolean resp = SueloC_DB.insertarSueloCancha(sc);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha registrado un Suelo correctamente'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al registrar el Suelo'"); 
        }
    }
    
    private void ActualizarSueloCancha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SueloC sc = new SueloC();
        sc.setCodigoSC(request.getParameter("txtCodigo"));
        sc.setNombreSC(request.getParameter("txtNombre")); 
        
        boolean resp = SueloC_DB.actualizarSueloCancha(sc);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha modificado el Suelo "+sc.getCodigoSC()+"'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error "); 
        }
    }
    
    private void darBajaSueloCancha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SueloC sc = new SueloC();
        sc.setCodigoSC(request.getParameter("codigoSC"));
        
        boolean resp = SueloC_DB.eliminarSueloCancha(sc);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha eliminado el Suelo"+sc.getCodigoSC()+"'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al eliminar '"); 
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
