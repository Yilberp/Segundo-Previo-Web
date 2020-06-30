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
public class Persona {

    public String cedula, nombre, edad, telefono, direccion, estadoCivil;

    public Persona() {
        this.cedula = "";
        this.nombre = "";
        this.edad = "";
        this.telefono = "";
        this.direccion = "";
        this.estadoCivil = "";
    }

    public boolean buscar(String cedula) throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        consulta = con.conn.createStatement();
        rs = consulta.executeQuery("select * from persona where cedula='"
                + cedula + "'");
        if (rs.next()) {
            this.cedula = cedula;
            this.nombre = rs.getString("nombre");
            this.edad = rs.getString("edad");
            this.telefono = rs.getString("telefono");
            this.direccion = rs.getString("direccion");
            this.estadoCivil = rs.getString("estadoCivil");
            return true;
        } else {
            return false;
        }
    }

    public void nuevo(String cedula, String nombre, String edad, String telefono, String direccion,
            String estadoCivil) throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        consulta = con.conn.createStatement();
        String sql = "insert into persona values('"
                + cedula + "','" + nombre + "','" + edad + "','"
                + telefono + "','" + direccion + "','" + estadoCivil + "')";
        consulta.executeUpdate(sql);
    }
    public ResultSet buscarTexto() throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        consulta = con.conn.createStatement();
        rs = consulta.executeQuery("select * from persona where cedula='"
                + cedula + "'");
       return rs;
    }
    public ResultSet buscarTexto2() throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        consulta = con.conn.createStatement();
        rs = consulta.executeQuery("select * from persona");
       return rs;
    }
}
