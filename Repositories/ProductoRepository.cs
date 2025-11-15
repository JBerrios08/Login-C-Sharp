using System;
using System.Configuration;
using System.Data;
using LoginWebMySQL.Models;
using MySql.Data.MySqlClient;

namespace LoginWebMySQL.Repositories
{
    public class ProductoRepository
    {
        private string Cs => ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;

        public DataTable ObtenerProductos()
        {
            const string sql = @"SELECT id, nombre, categoria, descripcion, precio, cantidad, imagen_url
                                   FROM productos_pasteleria
                                   ORDER BY nombre";

            using (var cn = new MySqlConnection(Cs))
            using (var cmd = new MySqlCommand(sql, cn))
            using (var da = new MySqlDataAdapter(cmd))
            {
                var table = new DataTable();
                da.Fill(table);
                return table;
            }
        }

        public Producto ObtenerProducto(int id)
        {
            const string sql = @"SELECT id, nombre, categoria, descripcion, precio, cantidad, imagen_url
                                   FROM productos_pasteleria
                                   WHERE id = @id";

            using (var cn = new MySqlConnection(Cs))
            using (var cmd = new MySqlCommand(sql, cn))
            {
                cmd.Parameters.AddWithValue("@id", id);
                cn.Open();
                using (var reader = cmd.ExecuteReader())
                {
                    if (!reader.Read())
                    {
                        return null;
                    }

                    return new Producto
                    {
                        Id = reader.GetInt32("id"),
                        Nombre = reader.GetString("nombre"),
                        Categoria = reader.GetString("categoria"),
                        Descripcion = reader.IsDBNull(reader.GetOrdinal("descripcion")) ? string.Empty : reader.GetString("descripcion"),
                        Precio = reader.GetDecimal("precio"),
                        Cantidad = reader.GetInt32("cantidad"),
                        ImagenUrl = reader.IsDBNull(reader.GetOrdinal("imagen_url")) ? string.Empty : reader.GetString("imagen_url")
                    };
                }
            }
        }

        public bool InsertarProducto(Producto producto)
        {
            const string sql = @"INSERT INTO productos_pasteleria (nombre, categoria, descripcion, precio, cantidad, imagen_url)
                                   VALUES (@nombre, @categoria, @descripcion, @precio, @cantidad, @imagenUrl)";

            using (var cn = new MySqlConnection(Cs))
            using (var cmd = new MySqlCommand(sql, cn))
            {
                cmd.Parameters.AddWithValue("@nombre", producto.Nombre);
                cmd.Parameters.AddWithValue("@categoria", producto.Categoria);
                cmd.Parameters.AddWithValue("@descripcion", string.IsNullOrWhiteSpace(producto.Descripcion) ? (object)DBNull.Value : producto.Descripcion);
                cmd.Parameters.AddWithValue("@precio", producto.Precio);
                cmd.Parameters.AddWithValue("@cantidad", producto.Cantidad);
                cmd.Parameters.AddWithValue("@imagenUrl", string.IsNullOrWhiteSpace(producto.ImagenUrl) ? (object)DBNull.Value : producto.ImagenUrl);
                cn.Open();
                return cmd.ExecuteNonQuery() > 0;
            }
        }

        public bool ActualizarProducto(Producto producto)
        {
            const string sql = @"UPDATE productos_pasteleria
                                   SET nombre = @nombre,
                                       categoria = @categoria,
                                       descripcion = @descripcion,
                                       precio = @precio,
                                       cantidad = @cantidad,
                                       imagen_url = @imagenUrl
                                   WHERE id = @id";

            using (var cn = new MySqlConnection(Cs))
            using (var cmd = new MySqlCommand(sql, cn))
            {
                cmd.Parameters.AddWithValue("@nombre", producto.Nombre);
                cmd.Parameters.AddWithValue("@categoria", producto.Categoria);
                cmd.Parameters.AddWithValue("@descripcion", string.IsNullOrWhiteSpace(producto.Descripcion) ? (object)DBNull.Value : producto.Descripcion);
                cmd.Parameters.AddWithValue("@precio", producto.Precio);
                cmd.Parameters.AddWithValue("@cantidad", producto.Cantidad);
                cmd.Parameters.AddWithValue("@imagenUrl", string.IsNullOrWhiteSpace(producto.ImagenUrl) ? (object)DBNull.Value : producto.ImagenUrl);
                cmd.Parameters.AddWithValue("@id", producto.Id);
                cn.Open();
                return cmd.ExecuteNonQuery() > 0;
            }
        }

        public bool EliminarProducto(int id)
        {
            const string sql = @"DELETE FROM productos_pasteleria WHERE id = @id";

            using (var cn = new MySqlConnection(Cs))
            using (var cmd = new MySqlCommand(sql, cn))
            {
                cmd.Parameters.AddWithValue("@id", id);
                cn.Open();
                return cmd.ExecuteNonQuery() > 0;
            }
        }
    }
}
