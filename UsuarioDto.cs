using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Data.SqlClient;

namespace GestionUsuarios
{
    internal class UsuarioDto
    {
        private int id;
        private string nombre;
        private string apellido;
        private string email;
        private string pais;

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public string Email { get => email; set => email = value; }
        public string Pais { get => pais; set => pais = value; }
    }
}
