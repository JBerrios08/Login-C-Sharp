<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Crud.aspx.cs" Inherits="LoginWebMySQL.Crud" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventario de Pastelería</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
</head>
<body>
    <form id="formCrud" runat="server" class="bg-light min-vh-100">
        <div class="container py-5">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="h3 mb-0">Inventario de Pastelería</h1>
                    <asp:Label ID="lblUsuario" runat="server" CssClass="text-muted small"></asp:Label>
                </div>
                <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar sesión" CssClass="btn btn-outline-danger" OnClick="btnCerrarSesion_Click" />
            </div>

            <asp:PlaceHolder ID="phMensajes" runat="server"></asp:PlaceHolder>

            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h2 class="h5 mb-0">Productos disponibles</h2>
                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo producto" CssClass="btn btn-primary" OnClick="btnNuevo_Click" />
                    </div>
                    <asp:GridView ID="gvProductos" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="gvProductos_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="categoria" HeaderText="Categoría" />
                            <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="cantidad" HeaderText="Cantidad" />
                            <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                            <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                    <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-sm btn-outline-secondary me-2" CommandName="Editar" CommandArgument='<%# Eval("id") %>' />
                                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-sm btn-outline-danger" CommandName="Eliminar" CommandArgument='<%# Eval("id") %>' OnClientClick="return confirm('¿Deseas eliminar este producto?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="alert alert-info mb-0">Aún no hay productos registrados.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <asp:Panel ID="pnlFormulario" runat="server" Visible="false" CssClass="card shadow-sm">
                <div class="card-body">
                    <h2 class="h5 mb-3" id="tituloFormulario" runat="server">Agregar producto</h2>
                    <asp:HiddenField ID="hfProductoId" runat="server" />
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="txtNombre" class="form-label">Nombre</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                        </div>
                        <div class="col-md-6">
                            <label for="txtCategoria" class="form-label">Categoría</label>
                            <asp:TextBox ID="txtCategoria" runat="server" CssClass="form-control" placeholder="Ej. Pasteles, Postres fríos" />
                        </div>
                        <div class="col-md-4">
                            <label for="txtPrecio" class="form-label">Precio</label>
                            <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" placeholder="0.00" />
                        </div>
                        <div class="col-md-4">
                            <label for="txtCantidad" class="form-label">Cantidad disponible</label>
                            <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" placeholder="0" />
                        </div>
                        <div class="col-12">
                            <label for="txtDescripcion" class="form-label">Descripción</label>
                            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                        </div>
                    </div>
                    <div class="mt-4 d-flex justify-content-end gap-2">
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-outline-secondary" OnClick="btnCancelar_Click" />
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
                    </div>
                </div>
            </asp:Panel>
        </div>
    </form>
    <script src="Scripts/jquery-3.7.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
</body>
</html>
