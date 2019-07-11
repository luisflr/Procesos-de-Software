using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System.Data;
using Newtonsoft.Json;


namespace procesos
{
    /// <summary>
    /// Descripción breve de WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]


    public class WebService1 : System.Web.Services.WebService
    {
        private
            Procedimientos prc;
        public WebService1()
        {
            prc = new Procedimientos();
        }
        [WebMethod]
        public string Insertar_Producto(string Nombre, string Dimension, float Precio, float Cantidad)
        {
            prc.Insertar_Producto_proc(Nombre, Dimension, Precio, Cantidad);
            return "Producto insertado";
        }

        [WebMethod]
        public string Listado_Productos()
        {
            string Tabla = "Productos";
            return prc.Select_proc(Tabla);
        }
        [WebMethod]
        public string Eliminar_Producto(int IDProducto)
        {
            prc.eliminar_prod_proc(IDProducto);
            return "Producto eliminado";
        }
        [WebMethod]
        public string Registrar_Cliente(string NombreEmp,string ApellidoEmp,int TelefonoEmp,string DireccionEmp)
        {
            prc.insertar_cliente_proc(NombreEmp, ApellidoEmp, TelefonoEmp, DireccionEmp);
            return "Cliente registrado";
        }
        [WebMethod]
        public string Login(string Usuario, string Password)
        {
            return prc.Log_in(Usuario, Password);
        }
        [WebMethod]
        public string Actualizar_Producto(int IDProducto,int Valor)
        {
            prc.actualizar_producto_proc(IDProducto,Valor);
            return "Producto actualizado";
        }
    }
}
