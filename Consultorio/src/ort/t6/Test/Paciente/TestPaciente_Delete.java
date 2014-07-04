package ort.t6.Test.Paciente;

import ort.t6.Entities.Paciente;
import ort.t6.Managers.ManagerPaciente;;

public class TestPaciente_Delete {
	
	public void testPacienteDelete(String[] args) {
		
		ManagerPaciente s = new ManagerPaciente();
		
		System.out.println("TestPaciente: Inicio de Test - DELETE\n");
		
		s.delete(999999);
		
		Paciente[] pac = s.getAll();
		
		for(Paciente x: pac){
			System.out.println("- " + x.getPa_dni() + " " + x.getPa_nombre() + " " + x.getPa_apellido() + " " + x.getPa_sexo() + " " + x.getPa_nacimiento() + " " + x.getPa_direccion() + " " + x.getPa_telefono() + " " + x.getPa_celular() + " " + x.getPa_mail());
		}
		
		System.out.print("\n");
		System.out.println("TestPaciente: Fin de Test - DELETE");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		
	}

}
