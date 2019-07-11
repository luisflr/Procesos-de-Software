using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.DataAccess.Client;

namespace procesos
{
    public class get_conexion 
    {
        public get_conexion()
        {

        }
        public OracleConnection conn()
        {
            string oradb = "DATA SOURCE = localhost:1521 / xe; PERSIST SECURITY INFO = True; USER ID = UPROCESOS; PASSWORD = svaial20dlm";
            OracleConnection conexion = new OracleConnection(oradb);
            return conexion;
        }
        
    }
}