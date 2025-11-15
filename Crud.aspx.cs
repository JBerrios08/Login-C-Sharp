using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using LoginWebMySQL.Services;

namespace LoginWebMySQL
{
    public partial class Crud : System.Web.UI.Page
    {
        private readonly ProductoService _productoService = new ProductoService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            lblUsuario.Text = $"Usuario: {Session["Usuario"]}";

            if (!IsPostBack)
            {
                CargarProductos();
            }
        }

        private void CargarProductos()
        {
            gvProductos.DataSource = _productoService.ObtenerProductos();
            gvProductos.DataBind();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            phMensajes.Controls.Clear();
            MostrarFormulario(true);
            LimpiarFormulario();
            tituloFormulario.InnerText = "Agregar producto";
            chkEliminarImagen.Visible = false;
            lblEliminarImagen.Visible = false;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            MostrarFormulario(false);
            LimpiarFormulario();
            phMensajes.Controls.Clear();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            phMensajes.Controls.Clear();

            byte[] imagenBytes = null;
            string contentType = null;
            var actualizarImagen = false;
            var eliminarImagen = chkEliminarImagen.Visible && chkEliminarImagen.Checked;

            if (fuImagen.HasFile)
            {
                var extension = Path.GetExtension(fuImagen.FileName)?.ToLowerInvariant();
                var tipoArchivo = fuImagen.PostedFile?.ContentType?.ToLowerInvariant();
                var extensionesPermitidas = new[] { ".jpg", ".jpeg", ".png", ".gif" };

                if (string.IsNullOrEmpty(extension) || Array.IndexOf(extensionesPermitidas, extension) < 0 || string.IsNullOrEmpty(tipoArchivo) || !tipoArchivo.StartsWith("image/", StringComparison.Ordinal))
                {
                    phMensajes.Controls.Add(new LiteralControl("<div class='alert alert-warning'>Selecciona una imagen válida en formato JPG, PNG o GIF.</div>"));
                    return;
                }

                using (var reader = new BinaryReader(fuImagen.PostedFile.InputStream))
                {
                    imagenBytes = reader.ReadBytes(fuImagen.PostedFile.ContentLength);
                }

                if (imagenBytes == null || imagenBytes.Length == 0)
                {
                    phMensajes.Controls.Add(new LiteralControl("<div class='alert alert-warning'>El archivo de imagen está vacío.</div>"));
                    return;
                }

                contentType = tipoArchivo;
                actualizarImagen = true;
                eliminarImagen = false;
            }

            var ok = _productoService.GuardarProducto(
                hfProductoId.Value,
                txtNombre.Text,
                txtCategoria.Text,
                txtDescripcion.Text,
                txtPrecio.Text,
                txtCantidad.Text,
                imagenBytes,
                contentType,
                actualizarImagen,
                eliminarImagen,
                out var mensaje);
            phMensajes.Controls.Add(new LiteralControl(mensaje));

            if (ok)
            {
                MostrarFormulario(false);
                LimpiarFormulario();
                CargarProductos();
            }
        }

        protected void gvProductos_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                if (int.TryParse(e.CommandArgument.ToString(), out var id))
                {
                    var producto = _productoService.ObtenerProducto(id);
                    if (producto != null)
                    {
                        hfProductoId.Value = producto.Id.ToString();
                        txtNombre.Text = producto.Nombre;
                        txtCategoria.Text = producto.Categoria;
                        txtDescripcion.Text = producto.Descripcion;
                        txtPrecio.Text = producto.Precio.ToString("0.00");
                        txtCantidad.Text = producto.Cantidad.ToString();
                        txtImagenUrl.Text = producto.ImagenUrl;
                        tituloFormulario.InnerText = "Editar producto";
                        MostrarImagenActual(producto.Imagen, producto.ImagenContentType);
                        chkEliminarImagen.Checked = false;
                        var tieneImagen = producto.Imagen != null && producto.Imagen.Length > 0;
                        chkEliminarImagen.Visible = tieneImagen;
                        lblEliminarImagen.Visible = tieneImagen;
                        MostrarFormulario(true);
                    }
                }
            }
            else if (e.CommandName == "Eliminar")
            {
                if (int.TryParse(e.CommandArgument.ToString(), out var id))
                {
                    var ok = _productoService.EliminarProducto(id, out var mensaje);
                    phMensajes.Controls.Clear();
                    phMensajes.Controls.Add(new System.Web.UI.LiteralControl(mensaje));
                    if (ok)
                    {
                        CargarProductos();
                    }
                }
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void gvProductos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow)
            {
                return;
            }

            if (e.Row.DataItem is DataRowView dataRow)
            {
                var img = e.Row.FindControl("imgProducto") as Image;
                var litSinImagen = e.Row.FindControl("litSinImagen") as Literal;

                var bytes = dataRow["imagen"] as byte[];
                var tipo = dataRow["imagen_content_type"] as string;

                if (bytes != null && bytes.Length > 0 && !string.IsNullOrWhiteSpace(tipo))
                {
                    var base64 = Convert.ToBase64String(bytes);
                    if (img != null)
                    {
                        img.ImageUrl = $"data:{tipo};base64,{base64}";
                        img.Visible = true;
                    }

                    if (litSinImagen != null)
                    {
                        litSinImagen.Visible = false;
                    }
                }
                else
                {
                    if (img != null)
                    {
                        img.Visible = false;
                    }

                    if (litSinImagen != null)
                    {
                        litSinImagen.Visible = true;
                    }
                }
            }
        }

        private void MostrarFormulario(bool mostrar)
        {
            pnlFormulario.Visible = mostrar;
        }

        private void LimpiarFormulario()
        {
            hfProductoId.Value = string.Empty;
            txtNombre.Text = string.Empty;
            txtCategoria.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtPrecio.Text = string.Empty;
            txtCantidad.Text = string.Empty;
            MostrarImagenActual(null, null);
            chkEliminarImagen.Checked = false;
            chkEliminarImagen.Visible = false;
            lblEliminarImagen.Visible = false;
        }

        private void MostrarImagenActual(byte[] imagen, string contentType)
        {
            if (imagen != null && imagen.Length > 0 && !string.IsNullOrWhiteSpace(contentType))
            {
                pnlVistaPrevia.Visible = true;
                var base64 = Convert.ToBase64String(imagen);
                imgVistaPrevia.ImageUrl = $"data:{contentType};base64,{base64}";
            }
            else
            {
                pnlVistaPrevia.Visible = false;
                imgVistaPrevia.ImageUrl = string.Empty;
            }
        }
    }
}
