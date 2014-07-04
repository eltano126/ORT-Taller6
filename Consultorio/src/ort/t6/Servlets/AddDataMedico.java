package ort.t6.Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ort.t6.Managers.ManagerMedico;

@WebServlet("/AddDataMedico")
public class AddDataMedico extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDataMedico() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String matricula = request.getParameter("matricula");
		String usuario = request.getParameter("usuario");
		String pass = request.getParameter("pass");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");

	    ManagerMedico mt = new ManagerMedico();
	    
	    mt.insert(Integer.parseInt(matricula), usuario, pass, nombre, apellido);

	    response.sendRedirect("pages/Medicos.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
