package textoPokemon;

public class Main {
	
	public static void main(String[] args) {
		Pokemon pokemon1=new Pokemon();
		Pokemon pokemon2=new Pokemon();
		Pokemon pokemon3=new Pokemon();
		
		Pokemon[] pokemonArray = {pokemon1,pokemon2,pokemon3,pokemon1,pokemon1};
		pokemon1.setPokemonArray(pokemonArray);
	
		
		
		
		pokemon1.imprimirPokemonTxt();
		pokemon1.leerPokemonTxt();
	}

}
