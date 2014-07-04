package ort.t6.Test.Tratamiento;

import ort.t6.Entities.Turno;
import ort.t6.Managers.ManagerTurno;

public class TestTurno {
	public static void main(String[] args) {
		
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		System.out.println("INICIO TEST TURNO:");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		
ManagerTurno mt = new ManagerTurno();
Turno[] list = mt.getAll();

for(Turno x: list){
	System.out.println(x.getTu_id() + " " + x.getTu_medico().getMe_apellido() + " " + x.getTu_paciente().getPa_apellido() + " " + x.getTu_tratamiento().getTr_descripcion()+ " "+ x.getTu_fecha() + " "+ x.getTu_modulo().getHo_desde() + " " + x.getTu_modulo().getHo_hasta());
}
		
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		System.out.println("FIN TEST TURNO:");
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
	}
}
