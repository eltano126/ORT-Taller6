package ort.t6.Test.Paciente;

import ort.t6.Entities.Paciente;
import ort.t6.Managers.ManagerPaciente;

public class TestPaciente_Insert {
	
	public void testPacienteInsert(String[] args) {
		
		ManagerPaciente s = new ManagerPaciente();
	
		System.out.println("TestPaciente: Inicio de Test - INSERT\n");
		
		s.insert(859852, "Paciente", "Pacienton", "M", "05/09/2017", "Calle Falsa 123", 79863547, 1565458996, "paciente@gmail.com");
		s.insert(44444, "PacienteUpdate", "Pacienton", "M", "06/09/2017", "Calle Falsa 123", 79863547, 1565458996, "pacienteupdate@gmail.com");
		s.insert(999999, "PacienteBorrar", "PacientonBorrar", "F", "07/09/2017", "Calle Falsa 123", 79863547, 1565458996, "pacienteborrado@gmail.com");
		
		Paciente[] pac = s.getAll();
		
		for(Paciente x: pac){
			System.out.println("- " + x.getPa_dni() + " " + x.getPa_nombre() + " " + x.getPa_apellido() + " " + x.getPa_sexo() + " " + x.getPa_nacimiento() + " " + x.getPa_direccion() + " " + x.getPa_telefono() + " " + x.getPa_celular() + " " + x.getPa_mail());
		}
		
		System.out.print("\n");
		System.out.println("TestPaciente: Fin de Test - INSERT");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		
	}

}
