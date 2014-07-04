package ort.t6.Test.Tratamiento;

public class TestTratamiento {
	
	public static void main(String[] args) {
		
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		System.out.println("INICIO TEST TRATAMIENTO:");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		
		TestTratamiento_Insert insert = new TestTratamiento_Insert();
		insert.testTratamiento_Insert(args);
		
		TestTratamiento_Update update = new TestTratamiento_Update();
		update.testTratamiento_Update(args);
		
		TestTratamiento_Delete delete = new TestTratamiento_Delete();
		delete.testTratamiento_Delete(args);
		
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		System.out.println("FIN TEST TRATAMIENTO:");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		
		
	}

}