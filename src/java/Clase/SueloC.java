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
public class SueloC {
    private String CodigoSC;
    private String NombreSC;
    private String EstadoSC;

    public SueloC() {
    }

    public SueloC(String CodigoSC, String NombreSC, String EstadoSC) {
        this.CodigoSC = CodigoSC;
        this.NombreSC = NombreSC;
        this.EstadoSC = EstadoSC;
    }

    public String getCodigoSC() {
        return CodigoSC;
    }

    public String getNombreSC() {
        return NombreSC;
    }

    public String getEstadoSC() {
        return EstadoSC;
    }

    public void setCodigoSC(String CodigoSC) {
        this.CodigoSC = CodigoSC;
    }

    public void setNombreSC(String NombreSC) {
        this.NombreSC = NombreSC;
    }

    public void setEstadoSC(String EstadoSC) {
        this.EstadoSC = EstadoSC;
    }
    
}
