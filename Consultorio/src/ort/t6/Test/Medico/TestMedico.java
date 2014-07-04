package ort.t6.Test.Medico;

public class TestMedico {
	
	public static void main(String[] args) {
		
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		System.out.println("INICIO TEST MEDICO:\n");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		
		TestMedico_Insert insert = new TestMedico_Insert();
		insert.testMedicoInsert(args);
		
		TestMedico_Update update = new TestMedico_Update();
		update.testMedicoUpdate(args);
		
		TestMedico_Delete delete = new TestMedico_Delete();
		delete.testMedicoDelete(args);
		
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		System.out.println("FIN TEST MEDICO:");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");

	}
	
}