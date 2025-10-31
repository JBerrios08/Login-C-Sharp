using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace LoginWebMySQL.Repositories
{
    public class UserRepository
    {
        private string Cs => ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;

        public bool InsertarUsuario(string usuario, string password)
        {
            const string sql = @"INSERT INTO `user` (usuario, password)
                                 VALUES (@u, @p);";

            using (var cn = new MySqlConnection(Cs))
            using (var cmd = new MySqlCommand(sql, cn))
            {
                cmd.Parameters.AddWithValue("@u", usuario);
                cmd.Parameters.AddWithValue("@p", password);
                cn.Open();
                return cmd.ExecuteNonQuery() > 0;
            }
        }

        public bool UsuarioExiste(string usuario)
        {
            const string sql = @"SELECT COUNT(*)
                                 FROM `user`
                                 WHERE usuario = @u;";

            using (var cn = new MySqlConnection(Cs))
            using (var cmd = new MySqlCommand(sql, cn))
            {
                cmd.Parameters.AddWithValue("@u", usuario);
                cn.Open();
                var count = Convert.ToInt64(cmd.ExecuteScalar());
                return count > 0;
            }
        }

        public bool ValidarCredenciales(string usuario, string password)
        {
            const string sql = @"SELECT COUNT(*)
                                 FROM `user`
                                 WHERE usuario = @u AND password = @p;";

            using (var cn = new MySqlConnection(Cs))
            using (var cmd = new MySqlCommand(sql, cn))
            {
                cmd.Parameters.AddWithValue("@u", usuario);
                cmd.Parameters.AddWithValue("@p", password);
                cn.Open();
                var count = Convert.ToInt64(cmd.ExecuteScalar());
                return count > 0;
            }
        }
    }
}
