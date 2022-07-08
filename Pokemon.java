package textoPokemon;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public class Pokemon {
	private String nombre;
	private String mote;
	private int vida;
	private int nivel;
	private String ataque1;
	private String ataque2;
	private String ataque3;
	private String elemento;
	private Pokemon [] pokemonArray= new Pokemon[5] ;

	public Pokemon(String nuevoNombre, String nuevoMote, int nuevaVida, int nuevoNivel, String nuevoElemento,
			String nuevoAtaque1, String nuevoAtaque2, String nuevoAtaque3) {
		nombre = nuevoNombre;
		mote = nuevoMote;
		elemento = nuevoElemento;
		ataque1 = nuevoAtaque1;
		ataque2 = nuevoAtaque2;
		ataque3 = nuevoAtaque3;
		vida = nuevaVida;
		nivel = nuevoNivel;
	}

	public Pokemon() {
		// añadir pokemon random
		nuevoPokemon();

	}
	
	public Pokemon[] getPokemonArray() {
		return pokemonArray;
	}

	public void setPokemonArray(Pokemon[] pokemonArray) {
		this.pokemonArray = pokemonArray;
	}

	// gets tipo int
	public int getVida() {
		return vida;

	}

	public int getNivel() {
		return nivel;

	}

	// gets de tipo String
	public String getNombre() {
		return nombre;

	}

	public String getMote() {
		return mote;
	}

	public String getAtaque1() {
		return ataque1;

	}

	public String getAtaque2() {
		return ataque2;

	}

	public String getAtaque3() {
		return ataque3;

	}

	public String getElemento() {
		return elemento;

	}

	// setters
	public void setPokemonNum(int nuevaVida, int nuevoNivel) {
		vida = nuevaVida;
		nivel = nuevoNivel;

	}

	public void setPokemonString(String nuevoNombre, String nuevoMote, String nuevoAtaque1, String nuevoAtaque2,
			String nuevoAtaque3, String nuevoElemento) {
		nombre = nuevoNombre;
		mote = nuevoMote;
		ataque1 = nuevoAtaque1;
		ataque2 = nuevoAtaque2;
		ataque3 = nuevoAtaque3;
		elemento = nuevoElemento;

	}

	public String atacarRandom() {
		int aleatorio = (int) (1 + 3 * Math.random());
		if (aleatorio == 1) {
			return ataque1;
		}

		if (aleatorio == 2) {
			return ataque2;
		}

		if (aleatorio == 3) {
			return ataque3;
		}

		return atacarRandom();

	}

	public void nuevoPokemon() {
		int aleatorio = (int) (Math.random() * 9 + 2);

		if (aleatorio == 1 || aleatorio == 2 || aleatorio == 3) {
			nombre = "Charmander";
			vida = 50;
			nivel = 35;
			ataque1 = "cola ferrea";
			ataque2 = "llamarada";
			ataque3 = "ascuas";
			elemento = "fuego";
		}

		if (aleatorio == 4 || aleatorio == 5 || aleatorio == 6) {
			nombre = "Squirtle";
			vida = 50;
			nivel = 15;
			ataque1 = "salpicadura";
			ataque2 = "surf";
			ataque3 = "hidrobombao";
			elemento = "agua";
		}

		if (aleatorio == 7 || aleatorio == 8 || aleatorio == 9) {
			nombre = "Bulbasaur";
			vida = 50;
			nivel = 45;
			ataque1 = "hoja afilada";
			ataque2 = "latigazo";
			ataque3 = "danza lluvia";
			elemento = "planta";
		}

		if (aleatorio == 10) {
			nombre = "Pikachu";
			vida = 50;
			nivel = 85;
			ataque1 = "impactrueno";
			ataque2 = "rayo";
			ataque3 = "trueno";
			elemento = "eléctrico";
		}

	}

	public void imprimirPokemonTxt() {
		PrintWriter escritor;
		try {
			escritor = new PrintWriter(new FileWriter("pokemon.txt",true));
			escritor.format("[Pokemon] %n" + "\tNombre= %s %n" + "\tMote= %s %n" + "\tNivel= %d %n" + "\tVida= %d%n",
					this.getNombre(), this.getMote(), this.getNivel(), this.getVida());
			for(int i=0;i<pokemonArray.length;i++) {
			escritor.format("[Pokemon %d] %n"+"\tNombre= %s %n" + "\tMote= %s %n" + "\tNivel= %d %n" + "\tVida= %d%n",i+1, pokemonArray[i].getNombre(), pokemonArray[i].getMote(), pokemonArray[i].getNivel(), pokemonArray[i].getNivel());
			}
			escritor.close();

		} catch (IOException e1) {

			e1.printStackTrace();
		}

	}

	public void leerPokemonTxt() {
		Scanner lector = null;

		try {
			lector = new Scanner(new BufferedReader(new FileReader("pokemon.txt")));
			lector.useDelimiter("/n");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		String s;
		while (lector.hasNext()) {
			s = lector.next();
			System.out.println(s);
		}

		lector.close();

	}

	@Override
	public String toString() {
		String s;
		s = "NombrePokemon: " + this.nombre + " Nivel: " + this.nivel;
		return s;
	}

}
