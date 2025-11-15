using System;
using System.Data;
using System.Globalization;
using LoginWebMySQL.Models;
using LoginWebMySQL.Repositories;

namespace LoginWebMySQL.Services
{
    public class ProductoService
    {
        private readonly ProductoRepository _repo = new ProductoRepository();

        public DataTable ObtenerProductos()
        {
            return _repo.ObtenerProductos();
        }

        public Producto ObtenerProducto(int id)
        {
            return _repo.ObtenerProducto(id);
        }

        public bool GuardarProducto(string idTexto, string nombre, string categoria, string descripcion, string precioTexto, string cantidadTexto, string imagenUrl, out string mensaje)
        {
            var nombreLimpio = (nombre ?? string.Empty).Trim();
            var categoriaLimpia = (categoria ?? string.Empty).Trim();
            var descripcionLimpia = (descripcion ?? string.Empty).Trim();
            var precioLimpio = (precioTexto ?? string.Empty).Trim();
            var cantidadLimpia = (cantidadTexto ?? string.Empty).Trim();
            var imagenUrlLimpia = (imagenUrl ?? string.Empty).Trim();

            if (nombreLimpio.Length == 0)
            {
                mensaje = "<div class='alert alert-warning'>Ingresa el nombre del producto.</div>";
                return false;
            }

            if (categoriaLimpia.Length == 0)
            {
                mensaje = "<div class='alert alert-warning'>Selecciona o escribe una categoría.</div>";
                return false;
            }

            if ((!decimal.TryParse(precioLimpio, NumberStyles.Number, CultureInfo.CurrentCulture, out var precio) &&
                 !decimal.TryParse(precioLimpio, NumberStyles.Number, CultureInfo.InvariantCulture, out precio)) || precio < 0)
            {
                mensaje = "<div class='alert alert-warning'>Ingresa un precio válido (mayor o igual a cero).</div>";
                return false;
            }

            if ((!int.TryParse(cantidadLimpia, NumberStyles.Integer, CultureInfo.CurrentCulture, out var cantidad) &&
                 !int.TryParse(cantidadLimpia, NumberStyles.Integer, CultureInfo.InvariantCulture, out cantidad)) || cantidad < 0)
            {
                mensaje = "<div class='alert alert-warning'>Ingresa una cantidad válida (mayor o igual a cero).</div>";
                return false;
            }

            var producto = new Producto
            {
                Nombre = nombreLimpio,
                Categoria = categoriaLimpia,
                Descripcion = descripcionLimpia,
                Precio = precio,
                Cantidad = cantidad,
                ImagenUrl = imagenUrlLimpia
            };

            var esActualizacion = int.TryParse(idTexto, out var id) && id > 0;
            if (esActualizacion)
            {
                producto.Id = id;
                var ok = _repo.ActualizarProducto(producto);
                mensaje = ok
                    ? "<div class='alert alert-success'>Producto actualizado correctamente.</div>"
                    : "<div class='alert alert-danger'>No se pudo actualizar el producto.</div>";
                return ok;
            }

            var creado = _repo.InsertarProducto(producto);
            mensaje = creado
                ? "<div class='alert alert-success'>Producto agregado correctamente.</div>"
                : "<div class='alert alert-danger'>No se pudo guardar el producto.</div>";
            return creado;
        }

        public bool EliminarProducto(int id, out string mensaje)
        {
            if (id <= 0)
            {
                mensaje = "<div class='alert alert-warning'>Selecciona un producto válido.</div>";
                return false;
            }

            var ok = _repo.EliminarProducto(id);
            mensaje = ok
                ? "<div class='alert alert-success'>Producto eliminado correctamente.</div>"
                : "<div class='alert alert-danger'>No se pudo eliminar el producto.</div>";
            return ok;
        }
    }
}
