using LoginWebMySQL.Repositories;

namespace LoginWebMySQL.Services
{
    public class UserService
    {
        private readonly UserRepository _repo = new UserRepository();

        public bool RegistrarUsuario(string usuario, string password, out string mensaje)
        {
            var u = (usuario ?? "").Trim();
            var p = (password ?? "").Trim();

            if (u.Length == 0 || p.Length == 0)
            {
                mensaje = "<div class='alert alert-warning mt-3'>Escribe usuario y contraseña.</div>";
                return false;
            }

            var ok = _repo.InsertarUsuario(u, p);
            mensaje = ok
                ? "<div class='alert alert-success mt-3'>Guardado correctamente.</div>"
                : "<div class='alert alert-danger mt-3'>No se pudo guardar.</div>";
            return ok;
        }
    }
}
