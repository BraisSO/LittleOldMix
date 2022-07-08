package prácticaExamen;

public class Arquero extends Aldeano {
	
	public static final String LARGO  = "Flechazo largo";
	public static final String CORTO  = "Revientacraneos";
	public static final String MEDIO  = "Perforaescudos";
	
	public Arquero(String nombre, int vida, int ataque, byte nivel) {
		super(nombre, vida, ataque, nivel);
	}

	
	@Override
	public void habilidadEspecialArquero(String tipo) {
		
		if (tipo=="LARGO") {
			System.out.println(LARGO);
		}
		if (tipo=="MEDIO") {
			System.out.println(MEDIO);
		}
		if (tipo=="CORTO") {
			System.out.println(CORTO);
		};
		
		;
	}
	
}
