using System;
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
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            MostrarFormulario(false);
            LimpiarFormulario();
            phMensajes.Controls.Clear();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            var ok = _productoService.GuardarProducto(hfProductoId.Value, txtNombre.Text, txtCategoria.Text, txtDescripcion.Text, txtPrecio.Text, txtCantidad.Text, out var mensaje);
            phMensajes.Controls.Clear();
            phMensajes.Controls.Add(new System.Web.UI.LiteralControl(mensaje));

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
                        tituloFormulario.InnerText = "Editar producto";
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
        }
    }
}
