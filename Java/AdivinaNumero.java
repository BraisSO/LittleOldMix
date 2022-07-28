import java.util.Scanner;

//- Escribir un xogo de adiviñanza. O programa pedirá ao usuario dous números (o número inferior e o número superior).
//O programa obterá, a continuación, un número aleatorio entre eses dous números, e o usuario deberá adiviñalo.
//Cada vez que o usuario introduce un número, o programa lle dice si é maior ou menor. Ao final, o programa indica o
//número de intentos utilizado.

public class AdivinaNumero {

	public static void main(String[] args) {
		Scanner escaner = new Scanner(System.in);
		System.out.println("Introduce el maximo:");
		int introducir = escaner.nextInt();
		System.out.println("Introduce el mínimo:");
		int introducir2 = escaner.nextInt();

		while (introducir<introducir2) {
			System.out.println("Introduce bien los rangos:");
			System.out.println("Introduce el maximo:");
			introducir = escaner.nextInt();
			System.out.println("Introduce el mínimo:");
			introducir2 = escaner.nextInt();
		}
		
		
		int aleatorio = (int) (Math.random()* introducir+1);
		while (!(aleatorio < introducir && aleatorio > introducir2)) {
			aleatorio = (int) (Math.random() * introducir+1);
		}
		
		
		int intentos = 0;
		int introducir3 = 0;
		while (aleatorio != introducir3) {
			System.out.println("Adivina el numero:");
			introducir3 = escaner.nextInt();
			intentos++;

			if (introducir3 < aleatorio) {
				System.out.println("Es mayor");
			}

			else if (introducir3 > aleatorio) {
				System.out.println("Es menor");
				
			} 
			
			else if (introducir3 == aleatorio) {
				System.out.println("Has acertado");
				System.out.println("Nº intentos:" + intentos);
			}
		}
	}
}
