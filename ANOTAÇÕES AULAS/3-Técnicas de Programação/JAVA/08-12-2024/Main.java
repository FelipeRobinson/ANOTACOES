public class Main {
    public static void main (String[] args) {
        try {
            Data hoje = new Data ((byte)12,(byte)8,(short)2024);
            
            System.out.printf ("O niver do Mali é %d/%d/%o!\n", hoje.getDia(), hoje.getMes(), hoje.getAno());
            
            hoje.setDia((byte)19);
            hoje.setMes((byte)1);
            hoje.setAno((short)1966);
            
            System.out.printf ("O niver do Mali é ", hoje.getDia() + "/" + hoje.getMes() + "/" + hoje.getAno() + "!");
        }   
        catch (Exception e) {
            System.err.printf(e.getMessage());
        }
    }
}