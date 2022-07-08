import java.util.Scanner;

//- Escribir un xogo de adivi�anza. O programa pedir� ao usuario dous n�meros (o n�mero inferior e o n�mero superior).
//O programa obter�, a continuaci�n, un n�mero aleatorio entre eses dous n�meros, e o usuario deber� adivi�alo.
//Cada vez que o usuario introduce un n�mero, o programa lle dice si � maior ou menor. Ao final, o programa indica o
//n�mero de intentos utilizado.

public class AdivinaNumero {

	public static void main(String[] args) {
		Scanner escaner = new Scanner(System.in);
		System.out.println("Introduce el maximo:");
		int introducir = escaner.nextInt();
		System.out.println("Introduce el m�nimo:");
		int introducir2 = escaner.nextInt();

		while (introducir<introducir2) {
			System.out.println("Introduce bien los rangos:");
			System.out.println("Introduce el maximo:");
			introducir = escaner.nextInt();
			System.out.println("Introduce el m�nimo:");
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
				System.out.println("N� intentos:" + intentos);
			}
		}
	}
}
