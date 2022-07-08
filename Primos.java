public class Primos {

	public static boolean esPrimo(int num) {
		boolean esPrimo= true;
		for (int i=2; i<=Math.sqrt(num); i++) {
			if (num%i==0) {
				esPrimo=false;
			}	
		}
		
		return esPrimo;
	
		
		
	}
	
	public static void main(String[] args) {
		
		System.out.println(esPrimo(9));
	}
	
}
