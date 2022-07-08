package pr�cticaExamen;

import java.util.Arrays;

public class AldeanoBase extends Aldeano implements Construcciones,Comparable<AldeanoBase> {
	
	private int ma�a;
	private int edad;
	private Aldeano [] arrayAldeanoBase;
	

	public AldeanoBase(String nombre, int vida, int ataque, byte nivel, int ma�a, int edad) {
		super(nombre, vida, ataque, nivel);
		this.ma�a = ma�a;
		this.edad = edad;
	}

	public int getMa�a() {
		return ma�a;
	}

	public void setMa�a(int ma�a) {
		this.ma�a = ma�a;
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
	
		return super.toString() + "Ma�a: " + this.ma�a + "Edad: " + this.edad;
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
	 * Funcion para ordenar AldeanosBase pero est� un poco errada, ya que en statico no deja usarla y para
	 * que funcione debe pasarsele un arraydeAldeanosBase {@link AldeanoBase} lo que no tiene mucho sentido.
	 * 
	 * Podr�a considerarse la inclusi�n de un par�metro familia.
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
