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
public class Cancha {
    private String CodigoC;
    private String ClaseCancha;
    private String SueloCancha;
    private String Descripcion;
    private double PrecioC;
    private String ImagenC;
    private String EstadoC;
    
    public Cancha(){
    }
    
   

    public Cancha(String CodigoC, String ClaseCancha, String SueloCancha, String Descripcion, double PrecioC, String ImagenC, String EstadoC) {
        this.CodigoC = CodigoC;
        this.ClaseCancha = ClaseCancha;
        this.SueloCancha = SueloCancha;
        this.Descripcion = Descripcion;
        this.PrecioC = PrecioC;
        this.ImagenC = ImagenC;
        this.EstadoC = EstadoC;
        
    }

    public String getCodigoC() {
        return CodigoC;
    }

    public String getClaseCancha() {
        return ClaseCancha;
    }

    public String getSueloCancha() {
        return SueloCancha;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public double getPrecioC() {
        return PrecioC;
    }

    public String getImagenC() {
        return ImagenC;
    }

    public String getEstadoC() {
        return EstadoC;
    }

    public void setCodigoC(String CodigoC) {
        this.CodigoC = CodigoC;
    }

    public void setClaseCancha(String ClaseCancha) {
        this.ClaseCancha = ClaseCancha;
    }

    public void setSueloCancha(String SueloCancha) {
        this.SueloCancha = SueloCancha;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public void setPrecioC(double PrecioC) {
        this.PrecioC = PrecioC;
    }

    public void setImagenC(String ImagenC) {
        this.ImagenC = ImagenC;
    }

    public void setEstadoC(String EstadoC) {
        this.EstadoC = EstadoC;
    }
    
    
}
