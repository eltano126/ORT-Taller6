package ort.t6.Test.Tratamiento;

import ort.t6.Entities.Tratamiento;
import ort.t6.Managers.ManagerTratamiento;

public class TestTratamiento_Delete {
	
	public void testTratamiento_Delete(String[] args) {
		
		ManagerTratamiento s = new ManagerTratamiento();
		
		System.out.println("TestTratamiento: Inicio de Test - DELETE\n");
		
		s.delete(3);
		
		Tratamiento[] trat = s.getAll();
		
		for(Tratamiento x: trat){
			System.out.println(x.getTr_id() + " " + x.getTr_nombre() + " " + x.getTr_descripcion() + " " + x.getTr_duracion());
		}
		
		System.out.print("\n");
		System.out.println("TestTratamiento: Fin de Test - DELETE");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		
	}

}
