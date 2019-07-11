using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System.Data;
using Newtonsoft.Json;

namespace procesos
{
    public class Procedimientos
    {
        private
            get_conexion gc;
        public Procedimientos()
        {
            gc = new get_conexion();
        }
        public void Insertar_Producto_proc(string nombre, string dimension, float precio, float cantidad)
        {
            OracleConnection c = gc.conn();
            c.Open();

            OracleParameter parametro1 = new OracleParameter();
            parametro1.OracleDbType = OracleDbType.Varchar2;
            parametro1.Value = nombre;

            OracleParameter parametro2 = new OracleParameter();
            parametro2.OracleDbType = OracleDbType.Varchar2;
            parametro2.Value = dimension;

            OracleParameter parametro3 = new OracleParameter();
            parametro3.OracleDbType = OracleDbType.Decimal;
            parametro3.Value = precio;

            OracleParameter parametro4 = new OracleParameter();
            parametro4.OracleDbType = OracleDbType.Int32;
            parametro4.Value = cantidad;


            OracleCommand comando = new OracleCommand();
            comando.Connection = c;

            comando.CommandText = "INSERT1";
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            comando.Parameters.Add("NOMBREP", OracleDbType.Varchar2).Value = parametro1.Value;
            comando.Parameters.Add("DIMENSIONP", OracleDbType.Varchar2).Value = parametro2.Value;
            comando.Parameters.Add("PRECIOP", OracleDbType.Decimal).Value = parametro3.Value;
            comando.Parameters.Add("CANTIDADP", OracleDbType.Int32).Value = parametro4.Value;
            comando.ExecuteNonQuery();
           
            c.Dispose();
        }
        public string Select_proc(string Tabla)
        {
            OracleConnection conn = gc.conn();
            conn.Open();

            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT * FROM " + Tabla;
            cmd.CommandType = System.Data.CommandType.Text;


            DataSet ds = new DataSet();
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.Fill(ds);

            return JsonConvert.SerializeObject(ds, Newtonsoft.Json.Formatting.Indented);

        }

        public void eliminar_prod_proc(int id)
        {
            OracleConnection c = gc.conn();
            c.Open();

            OracleParameter parametro1 = new OracleParameter();
            parametro1.OracleDbType = OracleDbType.Int32;
            parametro1.Value = id;

            OracleCommand comando = new OracleCommand();
            comando.Connection = c;

            comando.CommandText = "ELIMINAR_PRODUCTO";
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            comando.Parameters.Add("PRODUCTID", OracleDbType.Int32).Value = parametro1.Value;
            comando.ExecuteNonQuery();

            c.Dispose();
        }
        public void insertar_cliente_proc(string nombre, string apellido, int telefono,string direccion)
        {
            OracleConnection c = gc.conn();
            c.Open();

            OracleParameter parametro1 = new OracleParameter();
            parametro1.OracleDbType = OracleDbType.Varchar2;
            parametro1.Value = nombre;

            OracleParameter parametro2 = new OracleParameter();
            parametro2.OracleDbType = OracleDbType.Varchar2;
            parametro2.Value = apellido;

            OracleParameter parametro3 = new OracleParameter();
            parametro3.OracleDbType = OracleDbType.Int32;
            parametro3.Value = telefono;

            OracleParameter parametro4 = new OracleParameter();
            parametro4.OracleDbType = OracleDbType.Varchar2;
            parametro4.Value = direccion;

            OracleCommand comando = new OracleCommand();
            comando.Connection = c;

            comando.CommandText = "INSERT_CLIENTE";
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            comando.Parameters.Add("NOMBREC", OracleDbType.Varchar2).Value = parametro1.Value;
            comando.Parameters.Add("APELLIDOC", OracleDbType.Varchar2).Value = parametro2.Value;
            comando.Parameters.Add("TELEFONOC", OracleDbType.Int32).Value = parametro3.Value;
            comando.Parameters.Add("DIRECCIONC", OracleDbType.Varchar2).Value = parametro4.Value;
            comando.ExecuteNonQuery();

            c.Dispose();
        }
        public String Log_in( String email, String cont)
        {
            OracleConnection oc = gc.conn();
            oc.Open();
            
            OracleParameter parm = new OracleParameter();
            parm.OracleDbType = OracleDbType.Varchar2;
            parm.Value = email;

            OracleParameter parm1 = new OracleParameter();
            parm1.OracleDbType = OracleDbType.Varchar2;
            parm1.Value = cont;

            OracleCommand cmd = new OracleCommand();
            cmd.Connection = oc;


            cmd.CommandText = "PR_LOGIN"; // nombre del procedimiento
            cmd.CommandType = System.Data.CommandType.StoredProcedure;


            cmd.Parameters.Add("PV1", OracleDbType.Varchar2).Value = parm.Value; // pasa parametro de entrada
            cmd.Parameters.Add("PV2", OracleDbType.Varchar2).Value = parm1.Value;
            cmd.Parameters.Add("PV3", OracleDbType.Decimal).Direction = System.Data.ParameterDirection.Output; // pasa parametro de salida
            cmd.ExecuteNonQuery();
            String resp;

            try
            {
                resp = cmd.Parameters["PV3"].Value.ToString();
            }

            catch (Exception ex)
            {
                resp = ex.ToString();
            }


            oc.Close();
            return resp;

        }
        public void actualizar_producto_proc (int idpr,int valor)
        {
            OracleConnection c = gc.conn();
            c.Open();

            OracleParameter parametro1 = new OracleParameter();
            parametro1.OracleDbType = OracleDbType.Int32;
            parametro1.Value = idpr;
            OracleParameter parametro2 = new OracleParameter();
            parametro2.OracleDbType = OracleDbType.Int32;
            parametro2.Value = valor;


            OracleCommand comando = new OracleCommand();
            comando.Connection = c;

            comando.CommandText = "ACTUALIZAR_PRODUCTO";
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            comando.Parameters.Add("ID_PRODUCTOP", OracleDbType.Int32).Value = parametro1.Value;
            comando.Parameters.Add("VALORP", OracleDbType.Int32).Value = parametro2.Value;
            comando.ExecuteNonQuery();

            c.Dispose();
        }
    }
}