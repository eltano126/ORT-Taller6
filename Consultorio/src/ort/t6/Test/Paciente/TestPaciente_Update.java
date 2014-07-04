package ort.t6.Test.Paciente;

import ort.t6.Entities.Paciente;
import ort.t6.Managers.ManagerPaciente;

public class TestPaciente_Update {
	
	public void testPacienteUpdate(String[] args) {
			
		ManagerPaciente s = new ManagerPaciente();
		
		System.out.println("TestPaciente: Inicio de Test - UPDATE\n");

		s.updateinsert(44444,"PacienteUpdate", "Pacienton", "F", "06/09/2017", "Avenida Falsa 123", 79863547, 1565458996, "pacienteupdate@gmail.com");
		
		Paciente[] pac = s.getAll();

		for(Paciente x: pac){
			System.out.println("- " + x.getPa_dni() + " " + x.getPa_nombre() + " " + x.getPa_apellido() + " " + x.getPa_sexo() + " " + x.getPa_nacimiento() + " " + x.getPa_direccion() + " " + x.getPa_telefono() + " " + x.getPa_celular() + " " + x.getPa_mail());
		}

		System.out.print("\n");
		System.out.println("TestPaciente: Fin de Test - UPDATE");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
			
	}

}
