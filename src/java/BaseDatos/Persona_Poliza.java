/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseDatos;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Mindchift
 */
public class Persona_Poliza {

    public Date fecha;
    public Persona idpersona;
    public Vehiculo placaVehiculo;
    public Poliza idpoliza;
    public int totalPagar;
    public Corredor corredor;

    public Persona_Poliza() {
        long d = System.currentTimeMillis();
        fecha = new Date(d);
        idpersona = new Persona();
        placaVehiculo = new Vehiculo();
        idpoliza = new Poliza();
        totalPagar = 0;
        corredor = new Corredor();
    }

    public boolean buscarS(String id_persona, String placav) throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        consulta = con.conn.createStatement();
        rs = consulta.executeQuery("select * from persona_poliza where id_persona='"
                + id_persona + "'" + "and placaVehiculo='" + placav + "'");
        if (rs.next()) {
            long de = System.currentTimeMillis();
            this.fecha = new Date(de);
            this.idpersona.cedula = id_persona;
            this.placaVehiculo.placa = placav;
            this.idpoliza.idpoliza = 1;
            this.totalPagar = rs.getInt("totalPagar");
            this.corredor.usuariocorredor = rs.getString("id_corredor");
            return true;
        } else {
            return false;
        }
    }

    public void nuevoS(String id_persona, String placav, String usercorredor) throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        consulta = con.conn.createStatement();
        long d = System.currentTimeMillis();
        fecha = new Date(d);
        totalPagar = costoSoat(id_persona, placav);
        String sql = "insert into persona_poliza values('"
                + fecha + "','" + id_persona + "','" + placav + "','"
                + 1 + "','" + usercorredor + "','" + totalPagar + "')";
        consulta.executeUpdate(sql);
    }

    public int costoSoat(String id_persona, String placav) throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        consulta = con.conn.createStatement();
        int soat = 0;
        rs = consulta.executeQuery("select valor from vehiculo where id_persona='" + id_persona + "'"
                + "and placa='" + placav + "'");
        if (rs.next()) {
            this.totalPagar = rs.getInt("valor");
        }
        soat = (int) (totalPagar * 0.01);
        rs2 = consulta.executeQuery("select edad, estadoCivil from persona where cedula='" + id_persona + "'");
        if (rs2.next()) {
            if (rs2.getInt("edad") > 60) {
                totalPagar = (int) (soat + (totalPagar * 0.04));
            } else if (rs2.getInt("edad") > 45 && rs2.getInt("edad") < 60) {
                totalPagar = (int) (soat + (totalPagar * 0.06));
            }
            if (rs2.getString("estadoCivil").equals("casado/a")) {
                totalPagar = (int) (soat + (totalPagar * 0.07));
            } else {
                return soat;
            }
        }
        return totalPagar;
    }

    public void nuevoT(String id_persona, String placav, int radio, int rines, int aire, String usercorredor) throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        consulta = con.conn.createStatement();
        long d = System.currentTimeMillis();
        fecha = new Date(d);
        totalPagar = costoSoat(id_persona, placav);
        if (radio > 0) {
            totalPagar = (int) (totalPagar + (radio * 0.10));
        }
        if (rines > 0) {
            totalPagar = (int) (totalPagar + (rines * 0.10));
        }
        if (aire > 0) {
            totalPagar = (int) (totalPagar + (aire * 0.10));
        }
        String sql = "insert into persona_poliza values('"
                + fecha + "','" + id_persona + "','" + placav + "','"
                + 2 + "','" + usercorredor + "','" + totalPagar + "')";
        consulta.executeUpdate(sql);
    }

    public ResultSet buscarTexto(String idcorredor) throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        consulta = con.conn.createStatement();
        rs = consulta.executeQuery("select * from vehiculo  where placa in (select placaVehiculo from persona_poliza where id_corredor='" + idcorredor + "')");
        return rs;
    }
    public ResultSet buscarTexto2(String texto) throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        consulta = con.conn.createStatement();
        rs = consulta.executeQuery("select * from vehiculo where id_persona like '%"+texto+"%'");
        return rs;
    }
    public ResultSet buscarTODORIESGO() throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        consulta = con.conn.createStatement();
        rs = consulta.executeQuery("select id_persona from persona_poliza where id_poliza = 2");
        return rs;
    }
    public ResultSet buscarValorVehiculo(String placa) throws Exception {
        Conectar con = new Conectar();
        Statement consulta = null;
        ResultSet rs = null;
        consulta = con.conn.createStatement();
        rs = consulta.executeQuery("select valor from vehiculo where placa='"+placa+"'");
        return rs;
    }
}
