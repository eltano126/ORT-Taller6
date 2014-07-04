package ort.t6.Entities;

public class Turno {
	
	int tu_id;
	Horario tu_modulo;
	String tu_fecha;
	Medico tu_medico;
	Paciente tu_paciente;
	Tratamiento tu_tratamiento;
	
	
	public int getTu_id() {
		return tu_id;
	}
	public void setTu_id(int tu_id) {
		this.tu_id = tu_id;
	}
	public String getTu_fecha() {
		return tu_fecha;
	}
	public void setTu_fecha(String tu_fecha) {
		this.tu_fecha = tu_fecha;
	}
	public Horario getTu_modulo() {
		return tu_modulo;
	}
	public void setTu_modulo(Horario tu_modulo) {
		this.tu_modulo = tu_modulo;
	}
	public Medico getTu_medico() {
		return tu_medico;
	}
	public void setTu_medico(Medico tu_medico) {
		this.tu_medico = tu_medico;
	}
	public Paciente getTu_paciente() {
		return tu_paciente;
	}
	public void setTu_paciente(Paciente tu_paciente) {
		this.tu_paciente = tu_paciente;
	}
	public Tratamiento getTu_tratamiento() {
		return tu_tratamiento;
	}
	public void setTu_tratamiento(Tratamiento tu_tratamiento) {
		this.tu_tratamiento = tu_tratamiento;
	}
}
