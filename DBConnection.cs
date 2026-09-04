using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Data.SqlClient;

namespace GestionUsuarios
{
    internal class DBConnection
    {
        private string ConnectionString = "Data Source=tuservidor;Initial Catalog=GestionUsuarios;User ID=sa;Password=tupasword;Encrypt=True;TrustServerCertificate=True;";

        public SqlConnection ObtenerConexion()
        {
            SqlConnection connection = new SqlConnection(ConnectionString);
            return connection;
        }
    }
}
