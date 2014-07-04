package ort.t6.Test.Medico;

import ort.t6.Entities.Medico;
import ort.t6.Managers.ManagerMedico;

public class TestMedico_Delete {
	
	public void testMedicoDelete(String[] args) {
		
		ManagerMedico s = new ManagerMedico();
		
		System.out.println("TestMedico: Inicio de Test - DELETE\n");
		
		s.delete(3333);
		
		Medico[] med = s.getAll();
		
		for(Medico x: med){
			System.out.println(x.getMe_matricula() + " " + x.getMe_usuario() + " " + x.getMe_pass() + " " + x.getMe_nombre() + " " + x.getMe_apellido());
		}
		
		System.out.print("\n");
		System.out.println("TestMedico: Fin de Test - DELETE");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		
	}

}
