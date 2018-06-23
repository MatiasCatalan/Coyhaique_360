/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clase;

/**
 *
 * @author Luis Carcamo
 */
public class Arriendo {
    private String CodigoArriendo;
    private String CodigoCliente;
    private String Cliente;
    private double Total;
    private String Fecha;

    public Arriendo() {
    }
    public Arriendo(String CodigoArriendo, String CodigoCliente, String Cliente, double Total, String Fecha) {
        this.CodigoArriendo = CodigoArriendo;
        this.CodigoCliente = CodigoCliente;
        this.Cliente = Cliente;
        this.Total = Total;
        this.Fecha = Fecha;
    }

    public String getCodigoArriendo() {
        return CodigoArriendo;
    }

    public String getCodigoCliente() {
        return CodigoCliente;
    }

    public String getCliente() {
        return Cliente;
    }

    public double getTotal() {
        return Total;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setCodigoArriendo(String CodigoArriendo) {
        this.CodigoArriendo = CodigoArriendo;
    }

    public void setCodigoCliente(String CodigoCliente) {
        this.CodigoCliente = CodigoCliente;
    }

    public void setCliente(String Cliente) {
        this.Cliente = Cliente;
    }

    public void setTotal(double Total) {
        this.Total = Total;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }
    
        
    
}
