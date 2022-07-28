package recursividad;

public class BusquedaArray {

	public static boolean buscar(int numero, int posicion, int[] arrayDeEnteros) {
		boolean encontrado = false;

		if (numero == arrayDeEnteros[posicion]) {
			return true;

		}

		else if (posicion<arrayDeEnteros.length-1) {
			return buscar(numero, posicion + 1, arrayDeEnteros);
		}
		return encontrado;
		
	}

	public static void main(String[] args) {
		int[] arrayDeEnteros = { 5, 9, 6, 2, 1, 75, 36, 41, 55, 4 };
		boolean encontrado = false;
		encontrado = buscar(8, 0, arrayDeEnteros); // devuelve false
		System.out.println(encontrado);
		encontrado = buscar(75, 0, arrayDeEnteros); // devuelve true
		System.out.println(encontrado);
		

	}

}
