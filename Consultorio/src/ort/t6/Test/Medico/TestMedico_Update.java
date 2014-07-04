package ort.t6.Test.Medico;

import ort.t6.Entities.Medico;
import ort.t6.Managers.ManagerMedico;

public class TestMedico_Update {
	
	public void testMedicoUpdate(String[] args) {
		
		ManagerMedico s = new ManagerMedico();
		
		System.out.println("TestMedico: Inicio de Test - UPDATE\n");

		s.update(2222, "PedroUpdate", "Medico", "jmedico", "pass");
		
		Medico[] med = s.getAll();

		for(Medico x: med){
			System.out.println(x.getMe_matricula() + " " + x.getMe_usuario() + " " + x.getMe_pass() + " " + x.getMe_nombre() + " " + x.getMe_apellido());
		}

		System.out.print("\n");
		System.out.println("TestMedico: Fin de Test - UPDATE");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		
	}

}


