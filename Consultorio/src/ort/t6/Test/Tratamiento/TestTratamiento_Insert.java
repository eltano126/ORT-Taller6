package ort.t6.Test.Tratamiento;

import ort.t6.Entities.Tratamiento;
import ort.t6.Managers.ManagerTratamiento;

public class TestTratamiento_Insert {
	
	public void testTratamiento_Insert(String[] args) {
		
		ManagerTratamiento s = new ManagerTratamiento();
	
		System.out.println("TestTratamiento: Inicio de Test - INSERT\n");
		
		s.insert("TrataTest", "Es el Test de Tratamiento", 8);
		s.insert("TrataTest2", "Tratamiento2", 9);
		s.insert("TrataTest3", "Tratamiento3", 10);
		
		Tratamiento[] trat = s.getAll();
		
		for(Tratamiento x: trat){
			System.out.println(x.getTr_id() + " " + x.getTr_nombre() + " " + x.getTr_descripcion() + " " + x.getTr_duracion());
		}
		
		System.out.print("\n");
		System.out.println("TestTratamiento: Fin de Test - INSERT");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		
	}

}
