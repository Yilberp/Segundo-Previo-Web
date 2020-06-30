/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseDatos;

import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Mindchift
 */
public class Vehiculo {

    public String placa, modelo, marca, serial, valor;
    public Persona idpersona;

    public Vehiculo() {
        this.placa = "";
        this.modelo = "";
        this.marca = "";
        this.serial = "";
        this.valor = "";
        idpersona = new Persona();
    }

    public boolean buscar(String placa) throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        consulta = con.conn.createStatement();
        rs = consulta.executeQuery("select * from vehiculo where placa='"
                + placa + "'");
        if (rs.next()) {
            this.placa = placa;
            this.modelo = rs.getString("modelo");
            this.marca = rs.getString("marca");
            this.serial = rs.getString("serial");
            this.valor = rs.getString("valor");
            this.idpersona.cedula = rs.getString("id_persona");
            return true;
        } else {
            return false;
        }
    }

    public void nuevo(String placa, String modelo, String marca, String serial, String valor,
            String id_persona) throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        consulta = con.conn.createStatement();
        String sql = "insert into vehiculo values('"
                + placa + "','" + modelo + "','" + marca + "','"
                + serial + "','" + valor + "','" + id_persona + "')";
        consulta.executeUpdate(sql);
    }

    public ResultSet buscarTexto2(String texto) throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        consulta = con.conn.createStatement();
        rs = consulta.executeQuery("select * from vehiculo where id_persona like '%"+texto+"%'");
        return rs;
    }
     public ResultSet buscarModelo() throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        consulta = con.conn.createStatement();
        rs = consulta.executeQuery("select MODELO from tabla");
       return rs;
    }
     public ResultSet buscarMarca() throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        consulta = con.conn.createStatement();
        rs = consulta.executeQuery("select DISTINCT MARCA from tabla");
       return rs;
    }
}
