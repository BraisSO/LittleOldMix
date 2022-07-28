package prácticaExamen;

import java.util.Arrays;

public class AldeanoBase extends Aldeano implements Construcciones,Comparable<AldeanoBase> {
	
	private int maña;
	private int edad;
	private Aldeano [] arrayAldeanoBase;
	

	public AldeanoBase(String nombre, int vida, int ataque, byte nivel, int maña, int edad) {
		super(nombre, vida, ataque, nivel);
		this.maña = maña;
		this.edad = edad;
	}

	public int getMaña() {
		return maña;
	}

	public void setMaña(int maña) {
		this.maña = maña;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}
	
	public Aldeano[] getArrayAldeanoBase() {
		return arrayAldeanoBase;
	}

	public void setArrayAldeanoBase(Aldeano[] arrayAldeanoBase) {
		this.arrayAldeanoBase = arrayAldeanoBase;
	}
	
	@Override
	public void construirCasa() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void construirMaravilla() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int cambioMateriales(int objTransmutar) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof AldeanoBase) {
			AldeanoBase esteAldeanoBase = (AldeanoBase) obj;
		if (super.equals(esteAldeanoBase) && this.edad==esteAldeanoBase.edad) {
			return true;
		}}
		return false;
	}
	
	@Override
	public String toString() {
	
		return super.toString() + "Maña: " + this.maña + "Edad: " + this.edad;
	}
	
	@Override
	public int compareTo(AldeanoBase o) {
		if (this.getNivel() > o.getNivel())
			return 1;

		if (this.getNivel() == o.getNivel()) {
			return 0;
		} else
			return -1;
	}
	
	/**
	 * Funcion para ordenar AldeanosBase pero está un poco errada, ya que en statico no deja usarla y para
	 * que funcione debe pasarsele un arraydeAldeanosBase {@link AldeanoBase} lo que no tiene mucho sentido.
	 * 
	 * Podría considerarse la inclusión de un parámetro familia.
	 * 
	 * @see Comparable
	 * @see #compareTo(AldeanoBase)
	 * 
	 * 
	 */
	
	public void ordernarAldeanosNivel() {
		Arrays.sort(arrayAldeanoBase);

		}

	@Override
	public void habilidadEspecialArquero(String tipo) {
		// TODO Auto-generated method stub
		
	}


	

}
