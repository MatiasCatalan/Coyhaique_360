/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clase;

/**
 *
 * @author Luis Carcamo Espinoza
 */
public class DetalleArriendo {
    private String numero;
    private String CodigoArriendo;
    private String codigoCancha;
    private String NombreCancha;
    private double Precio;
    private double Cantidad;
    private double Descuento;
    private double SubTotal;
    private Cancha Cancha;
    private Arriendo Arriendo;

    public DetalleArriendo() {
    }

    public DetalleArriendo(String numero, String CodigoArriendo, String codigoCancha, String NombreCancha, double Precio, double Cantidad, double Descuento, double SubTotal, Cancha Cancha, Arriendo Arriendo) {
        this.numero = numero;
        this.CodigoArriendo = CodigoArriendo;
        this.codigoCancha = codigoCancha;
        this.NombreCancha = NombreCancha;
        this.Precio = Precio;
        this.Cantidad = Cantidad;
        this.Descuento = Descuento;
        this.SubTotal = SubTotal;
        this.Cancha = Cancha;
        this.Arriendo = Arriendo;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getCodigoArriendo() {
        return CodigoArriendo;
    }

    public void setCodigoArriendo(String CodigoArriendo) {
        this.CodigoArriendo = CodigoArriendo;
    }

    public String getCodigoCancha() {
        return codigoCancha;
    }

    public void setCodigoCancha(String codigoCancha) {
        this.codigoCancha = codigoCancha;
    }

    public String getNombreCancha() {
        return NombreCancha;
    }

    public void setNombreCancha(String NombreCancha) {
        this.NombreCancha = NombreCancha;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }

    public double getCantidad() {
        return Cantidad;
    }

    public void setCantidad(double Cantidad) {
        this.Cantidad = Cantidad;
    }

    public double getDescuento() {
        return Descuento;
    }

    public void setDescuento(double Descuento) {
        this.Descuento = Descuento;
    }

    public double getSubTotal() {
        return SubTotal;
    }

    public void setSubTotal(double SubTotal) {
        this.SubTotal = SubTotal;
    }

    public Cancha getCancha() {
        return Cancha;
    }

    public void setCancha(Cancha Cancha) {
        this.Cancha = Cancha;
    }

    public Arriendo getArriendo() {
        return Arriendo;
    }

    public void setArriendo(Arriendo Arriendo) {
        this.Arriendo = Arriendo;
    }

    
    
}
