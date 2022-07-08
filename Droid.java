package Main;

public class Droid {
    private String name;
    private int bateryLevel;

    public Droid(String name) {
        this.name = name;
        this.bateryLevel = 100;

    }

    public void performTask(String task){
        System.out.println(this.name + " is performing: " + task);
        this.bateryLevel=this.bateryLevel-10;
    }

    public void energyReport(){
        System.out.println(this.bateryLevel);
    }


    public static void energyTransfer(Droid droid1, Droid droid2){
        int aux;
        aux=droid1.bateryLevel;
        droid1.bateryLevel=droid2.bateryLevel;
        droid2.bateryLevel=aux;
    }


    @Override
    public String toString() {
      
        return  String.format("%s tiene %d de bateria", this.name,this.bateryLevel);
    }

    public static void main(String[] args) {
        Droid droid1 = new Droid("Terminator");
        Droid droid2 = new Droid("Asdroid");

        System.out.println(droid1.toString());

        droid1.performTask("danza");
        droid1.performTask("canta");
        droid1.performTask("salta");
        droid1.performTask("pega");

        System.out.println(droid1.toString());

        droid1.energyReport();
        droid2.energyReport();
        Droid.energyTransfer(droid1, droid2);
        droid1.energyReport();
        droid2.energyReport();

    }

}
