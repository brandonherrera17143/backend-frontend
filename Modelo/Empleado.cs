using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace web_umg_bd
{
    public class Empleado
    {
        ConexionBD conectar;
        private DataTable drop_puesto(){
            DataTable tabla = new DataTable();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string strConsulta = string.Format("select idPuesto as id,puesto from puestos;");
            MySqlDataAdapter consulta = new MySqlDataAdapter(strConsulta, conectar.conectar);
            consulta.Fill(tabla);
            conectar.CerarConexion();
            return tabla;
        }
        public void drop_puesto(DropDownList drop){
            drop.ClearSelection();
            drop.Items.Clear();
            drop.AppendDataBoundItems = true;
            drop.Items.Add("<< Elige Puesto >>");
            drop.Items[0].Value = "0";
            drop.DataSource = drop_puesto();
            drop.DataTextField = "puesto";
            drop.DataValueField = "id";
            drop.DataBind();

        }
        private DataTable grid_empleados() {
            DataTable tabla = new DataTable();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            String consulta = string.Format("select e.idEmpleado as id,e.nombre,e.apellido,e.direccion,e.telefono,e.DPI,e.fechaNacimiento,e.fechaIngresoRegistro,p.puesto,p.idPuesto from empleados as e inner join puestos as p on e.idPuesto = p.idPuesto;");
            MySqlDataAdapter query = new MySqlDataAdapter(consulta, conectar.conectar);
            query.Fill(tabla);
            conectar.CerarConexion();
            return tabla;
        }
        public void grid_empleados(GridView grid){
            grid.DataSource = grid_empleados();
            grid.DataBind();

        }
        public int agregar(string nombre,string apellido,string direccion,string telefono,string DPI, string fechaNacimiento, string fechaIngresoRegistro,int idPuesto){
            int no_ingreso = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string strConsulta = string.Format("insert into empleados(nombre,apellido,direccion,telefono,DPI,fechaNacimiento,fechaIngresoRegistro,idPuesto) values('{0}','{1}','{2}','{3}','{4}','{5}',{6},'{7}');",nombre,apellido,direccion,telefono,DPI,fechaNacimiento,fechaIngresoRegistro,idPuesto);
            MySqlCommand insertar = new MySqlCommand(strConsulta, conectar.conectar);
            
            insertar.Connection = conectar.conectar;
            no_ingreso = insertar.ExecuteNonQuery();
            conectar.CerarConexion();
            return no_ingreso;

        }
        public int modificar(int id,string nombre, string apellido, string direccion, string telefono, string DPI, string fechaNacimiento, string fechaingresoRegistro, int idPuesto){
            int no_ingreso = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
        public int modificar(int id,string nombre, string apellido, string direccion, string telefono, string DPI, string fechaNacimiento, string fechaingresoRegistro, int idPuesto){
            string strConsulta = string.Format("update empleados set id = '{0}',nombre = '{1}',apellido = '{2}',direccion='{3}',telefono='{4}',DPI='{5}'fechaNacimiento='{6}',fechaIngresoRegistro='{7}'idPuesto = {8} where idEmpleado = {7};", nombre,apellido,direccion,telefono,DPI,fechaNacimiento,fechaingresoRegistro,idPuesto);
            MySqlCommand modificar = new MySqlCommand(strConsulta, conectar.conectar);

            modificar.Connection = conectar.conectar;
            no_ingreso = modificar.ExecuteNonQuery();
            conectar.CerarConexion();
            return no_ingreso;
        }
        public int eliminar(int id){
            int no_ingreso = 0;
        conectar = new ConexionBD();
        conectar.AbrirConexion();
            string strConsulta = string.Format("delete from empleados  where idEmpleado = {0};", id);
        MySqlCommand eliminar = new MySqlCommand(strConsulta, conectar.conectar);

            eliminar.Connection = conectar.conectar;
            no_ingreso = eliminar.ExecuteNonQuery();
            conectar.CerarConexion();
            return no_ingreso;
        }

}
}