package ort.t6.Test.Medico;

import ort.t6.Entities.Medico;
import ort.t6.Managers.ManagerMedico;

public class TestMedico_Insert {
	
	public void testMedicoInsert(String[] args) {
		
		ManagerMedico s = new ManagerMedico();
	
		System.out.println("TestMedico: Inicio de Test - INSERT\n");
		
		s.insert(1111, "Juan", "Perez", "jperez", "pass");
		s.insert(2222, "Pedro", "Medico", "jmedico", "pass");
		s.insert(3333, "Maria", "Dominguez", "mdominguez", "pass");
		
		Medico[] med = s.getAll();
		
		for(Medico x: med){
			System.out.println(x.getMe_matricula() + " " + x.getMe_usuario() + " " + x.getMe_pass() + " " + x.getMe_nombre() + " " + x.getMe_apellido());
		}
		
		System.out.print("\n");
		System.out.println("TestMedico: Fin de Test - INSERT");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		
	}
	
}
