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
public class Corredor {
    public String usuariocorredor,clave;
    public int comision;
    
    public Corredor(){
        this.usuariocorredor = "";
        this.clave = "";
        this.comision = 0;
    }
    
    public boolean buscar(String nombreusaurio, String clave) throws Exception{
         Conectar con=new Conectar();
       Statement consulta=null;
       ResultSet rs=null;
       consulta=con.conn.createStatement();
       rs=consulta.executeQuery("select * from corredor where usuariocorredor='"+
               nombreusaurio+"' and clave='"+clave+"'");
       if(rs.next()){
          this.usuariocorredor=nombreusaurio;
          this.clave = clave;
          this.comision = rs.getInt("comision");
          return true;           
       }
       else{
           return false;
       }
    }
    public void modificar(String comision,String corredor) throws Exception{
       Conectar con=new Conectar();
       Statement consulta=null;
       ResultSet rs=null;
       consulta=con.conn.createStatement();
       String sql="update corredor set comision='"+
               comision+"' where usuariocorredor='"+corredor+"'";
       consulta.executeUpdate(sql);
   }
}
