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
public class ClaseC {
    private String CodigoCC;
    private String NombreCC;
    private String EstadoCC;

    public ClaseC() {
    }

    public ClaseC(String CodigoCC, String NombreCC, String EstadoCC) {
        this.CodigoCC = CodigoCC;
        this.NombreCC = NombreCC;
        this.EstadoCC = EstadoCC;
    }

    public String getCodigoCC() {
        return CodigoCC;
    }

    public String getNombreCC() {
        return NombreCC;
    }

    public String getEstadoCC() {
        return EstadoCC;
    }

    public void setCodigoCC(String CodigoCC) {
        this.CodigoCC = CodigoCC;
    }

    public void setNombreCC(String NombreCC) {
        this.NombreCC = NombreCC;
    }

    public void setEstadoCC(String EstadoCC) {
        this.EstadoCC = EstadoCC;
    }
    
    
    
}
