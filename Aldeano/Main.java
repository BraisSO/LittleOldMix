package prácticaExamen;

import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class Main {
	public static void main(String[] args) {
		
		Arquero arquero1= new Arquero("Robin", 15, 589, (byte)124);
		arquero1.habilidadEspecialArquero("LARGO");
		
		
		
		AldeanoBase aldeano1= new AldeanoBase("Pepe", 682, 70, (byte) 33, 84, 23);
		AldeanoBase  aldeano2= new AldeanoBase("Pepe", 68, 70, (byte) 55, 55, 23);
		AldeanoBase  aldeano3= new AldeanoBase("Pepe", 56, 42, (byte) 55, 55, 23);
		AldeanoBase  aldeano4= new AldeanoBase("Lopez", 34, 345, (byte)121, 84, 34);
		AldeanoBase aldeano5= new AldeanoBase("Sapo", 53, 70, (byte)15, 22, 23);
		
		AldeanoBase [] arrayAldeanoBase= {aldeano2, aldeano3, aldeano4, aldeano5}; 
		aldeano1.setArrayAldeanoBase(arrayAldeanoBase);
		
		aldeano1.ordernarAldeanosNivel();
	
		for (AldeanoBase e : arrayAldeanoBase) {
			System.out.println(e.getNivel());
		}
		
		System.out.println(aldeano2.equals(aldeano3));
	
		for (AldeanoBase e : arrayAldeanoBase) {
			System.out.println(e.toString());

			
		PrintWriter imprimirPersonaje;
		try {
			imprimirPersonaje = new PrintWriter("personaje.txt");
			imprimirPersonaje.println(aldeano1);
			imprimirPersonaje.println(aldeano2);
			imprimirPersonaje.println(aldeano3);
			imprimirPersonaje.println(aldeano4);
			imprimirPersonaje.println(aldeano5);
			imprimirPersonaje.close();
		
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		}
	}
}
