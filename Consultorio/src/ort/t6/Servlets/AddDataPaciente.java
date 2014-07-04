package ort.t6.Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ort.t6.Managers.ManagerPaciente;

@WebServlet("/AddDataPaciente")
public class AddDataPaciente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDataPaciente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dni = request.getParameter("dni");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String sexo = request.getParameter("sexo");
		String nacimiento = request.getParameter("nacimiento");
		String direccion = request.getParameter("direccion");
		String telefono = request.getParameter("telefono");
		String celular = request.getParameter("celular");
		String mail = request.getParameter("mail");
		
	    ManagerPaciente mt = new ManagerPaciente();
	    
	    mt.insert(Integer.parseInt(dni), nombre, apellido, sexo, nacimiento, direccion, Integer.parseInt(telefono), Integer.parseInt(celular), mail);

	    response.sendRedirect("pages/Pacientes.jsp");
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
