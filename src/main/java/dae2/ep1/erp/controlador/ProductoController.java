package dae2.ep1.erp.controlador;

import dae2.ep1.erp.dao.ProductoDAO;
import dae2.ep1.erp.modelo.Producto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Producto")
public class ProductoController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    ProductoDAO dao = new ProductoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {
            case "listar":
                request.setAttribute("productos", dao.listar());
                request.getRequestDispatcher("listarProductos.jsp").forward(request, response);
                break;
            case "nuevo":
                request.getRequestDispatcher("agregarProducto.jsp").forward(request, response);
                break;
            case "insertar":
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                double precio = Double.parseDouble(request.getParameter("precio"));
                int stock = Integer.parseInt(request.getParameter("stock"));

                Producto prod = new Producto();
                prod.setNombre(nombre);
                prod.setDescripcion(descripcion);
                prod.setPrecio(precio);
                prod.setStock(stock);

                dao.agregar(prod);
                response.sendRedirect("ProductoController?accion=listar");
                break;
            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                Producto producto = dao.buscar(id);
                request.setAttribute("producto", producto);
                request.getRequestDispatcher("editarProducto.jsp").forward(request, response);
                break;
            case "actualizar":
                int idActualizar = Integer.parseInt(request.getParameter("id"));
                String nombreAct = request.getParameter("nombre");
                String descripcionAct = request.getParameter("descripcion");
                double precioAct = Double.parseDouble(request.getParameter("precio"));
                int stockAct = Integer.parseInt(request.getParameter("stock"));

                Producto prodAct = new Producto();
                prodAct.setIdProducto(idActualizar);
                prodAct.setNombre(nombreAct);
                prodAct.setDescripcion(descripcionAct);
                prodAct.setPrecio(precioAct);
                prodAct.setStock(stockAct);

                dao.actualizar(prodAct);
                response.sendRedirect("ProductoController?accion=listar");
                break;
            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                response.sendRedirect("ProductoController?accion=listar");
                break;
            default:
                response.sendRedirect("ProductoController?accion=listar");
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Verificar sesión
        HttpSession session = request.getSession();
        if (session.getAttribute("usuario") == null) {
            response.sendRedirect("login.jsp");
        } else {
            processRequest(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
