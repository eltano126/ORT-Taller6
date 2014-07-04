package ort.t6.Test.Paciente;

public class TestPaciente {
	
	public static void main(String[] args) {
		
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		System.out.println("INICIO TEST PACIENTE:");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		
		TestPaciente_Insert insert = new TestPaciente_Insert();
		insert.testPacienteInsert(args);
		
		TestPaciente_Update update = new TestPaciente_Update();
		update.testPacienteUpdate(args);
		
		TestPaciente_Delete delete = new TestPaciente_Delete();
		delete.testPacienteDelete(args);
		
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		System.out.println("FIN TEST PACIENTE:");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		
	}

}