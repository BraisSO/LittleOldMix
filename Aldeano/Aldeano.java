package prácticaExamen;

import java.util.Arrays;

public abstract class Aldeano {
	private String nombre;
	private int vida;
	private int ataque;
	private byte nivel;

	// constructor
	public Aldeano(String nombre, int vida, int ataque, byte nivel) {
		this.nombre = nombre;
		this.vida = vida;
		this.ataque = ataque;
		this.nivel = nivel;
	}

	// getters & setters
	public int getAtaque() {
		return ataque;
	}

	public String getNombre() {
		return nombre;
	}

	public int getVida() {
		return vida;
	}

	public void setAtaque(int ataque) {
		this.ataque = ataque;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setVida(int vida) {
		this.vida = vida;
	}

	public byte getNivel() {
		return nivel;
	}

	public void setNivel(byte nivel) {
		this.nivel = nivel;
	}

	/**
	 * Métodos toString e equals que logo serán sobreescritos * @return
	 */

	@Override
	public String toString() {
		String s = "Nombre :" + nombre + " " + "Nivel :" + nivel + " " + "Vida :" + vida + " " + "Ataque : " + ataque;
		return s;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Aldeano) {
			Aldeano esteAldeano = (Aldeano) obj;

			if (this.nombre.equals(esteAldeano.nombre) && this.nivel == esteAldeano.nivel)

				return true;
		}
		return false;
	}

	// outras funcions
	// funcion vida
	public abstract void habilidadEspecialArquero(String tipo);


	}

