/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Clase.DetalleArriendo;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Clase.*;

/**
 *
 * @author Luis Carcamo
 */
public class Servlet_Cancha extends HttpServlet {

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
            
         
            if(accion.equals("actualizar")){
                this.ActualizarCancha(request, response); 
            }
            if(accion.equals("eliminar")){
                this.DarBajaCancha(request, response); 
            }
            if(accion.equals("recuperar")){
                this.DarAltaCancha(request, response); 
            }
            if(accion.equals("anadirCarrito")){
                this.AnadirCarrito(request, response);   
            }
        
            
        }
    }
    private void ActualizarCancha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cancha c = new Cancha();
        c.setCodigoC(request.getParameter("txtCodigo")); 
        c.setClaseCancha(request.getParameter("txtNombreCC")); 
        c.setSueloCancha(request.getParameter("txtNombreSC"));
        c.setDescripcion(request.getParameter("txtDescripcionC"));
        c.setPrecioC(Double.parseDouble(request.getParameter("txtPrecioC")));
        
        String imagen = request.getParameter("selected");
        
        if(imagen.equals("SelectImagenActual")){
            c.setImagenC(request.getParameter("txtImagen")); 
        }else{
            c.setImagenC(request.getParameter("txtModificarImagen")); 
        }
        
        boolean resp = Cancha_DB.actualizarCancha(c);
        
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='SE AH MODIFICADO LA CANCHA "+c.getCodigoC()+"'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens='ERROR'"); 
        }
    }
    
    private void DarBajaCancha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cancha c = new Cancha();
        c.setCodigoC(request.getParameter("codigoC")); 
        
        boolean resp = Cancha_DB.eliminarCancha(c);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='SE AH ELIMINADO LA CANCHA "+c.getCodigoC()+"'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens='ERROR'"); 
        }
    }
    
    private void DarAltaCancha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cancha c = new Cancha();
        c.setCodigoC(request.getParameter("codigoC")); 
        
        boolean resp = Cancha_DB.recuperarCancha(c);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens=' "+c.getCodigoC()+"'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens=''"); 
        }
    }
    
    
    private void AnadirCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DecimalFormat df = new DecimalFormat("0.00");
        DecimalFormatSymbols dfs = df.getDecimalFormatSymbols();
        dfs.setDecimalSeparator('.');
        df.setDecimalFormatSymbols(dfs);
        
        HttpSession session = request.getSession();
        ArrayList<DetalleArriendo> carritoArriendo;
        
        if(session.getAttribute("carrito") == null){
            carritoArriendo = new ArrayList<DetalleArriendo>();
        }else{
            carritoArriendo = (ArrayList<DetalleArriendo>)session.getAttribute("carrito");
        }
        
        Cancha c = Cancha_DB.listarCanchaPorCodigo(request.getParameter("txtCodigo")); 
        
        DetalleArriendo dv = new DetalleArriendo();
        dv.setCodigoCancha(request.getParameter("txtCodigo")); 
        dv.setNombreCancha(request.getParameter("txtNombreC")); 
        dv.setPrecio(Double.parseDouble(request.getParameter("txtPrecio")));
        dv.setCantidad(Double.parseDouble(request.getParameter("txtCantidad"))); 
        
        
        
        double subTotal = c.getPrecioC() * dv.getCantidad();
        
            dv.setDescuento(0); 
        
        
        dv.setSubTotal(dv.getPrecio() * dv.getCantidad());
        
        int indice = -1;
        for(int i=0; i<carritoArriendo.size(); i++){
            DetalleArriendo det = carritoArriendo.get(i);
            if(det.getCodigoCancha().equals(c.getCodigoC())){
                indice = i;
                break;
            }
        }
        
        if(indice == -1){
            dv.setNumero(String.valueOf(carritoArriendo.size() + 1)); 
            carritoArriendo.add(dv);
        }else{
            dv.setNumero(String.valueOf(indice + 1));
            carritoArriendo.set(indice, dv);
        }
        
        session.setAttribute("carrito", carritoArriendo); 
        request.getSession().setAttribute("parametroCliente", request.getParameter("txtCliente"));
        response.sendRedirect("RegistrarArriendo.jsp");
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
