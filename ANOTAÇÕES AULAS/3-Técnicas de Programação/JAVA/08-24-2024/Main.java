public class Main
{
    public static void main (String[] args)
    {
        try
        {
            Data d = new Data ((byte)31,(byte)12,(short)2024);
            
            System.out.println ("O Reveillon será "+
                                d.getDia()+"/"+
                                d.getMes()+"/"+
                                d.getAno()+"!"); 

            d.setDia((byte)19);
            d.setMes((byte)1);
            d.setAno((short)1966); 

            System.out.printf ("O aniversário do maligno é %d/%d/%d!\n",
                               d.getDia(),
                               d.getMes(),
                               d.getAno());        
        }
        catch (Exception erro)
        {
            System.err.println (erro.getMessage());
        }

    }
}
