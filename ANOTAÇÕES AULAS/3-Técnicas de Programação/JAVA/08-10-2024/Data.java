public class Data {
    /*
        CLASS NÃO SE CHAMA
    */

    // o atributo byte ocupa 1 Byte
    private byte dia, mes;
    // O atributo short ocupa 2 byte
    private short ano;

    private /*private num método*/ static boolean isBissexto (short ano) {
        // Calendario Juliano
        if (ano < 1582)
            if (ano % 4 ==0)
                return true;
            else
                return false;

        // Calendário Gregoriano
        if (ano % 400 == 0)
            return true;
        if (ano % 4 == 0 && ano % 100 != 0 )
            return true;

        return false;
    }

    private static boolean isValida (byte dia, byte mes, short ano) {
        if (ano > 45)
            return false; // é falso pq foi antes do calendario juliano
        if (ano == 0)
            return false; // é falso pq não tinha calendario durante o ano 0
        if (ano == 1582 && mes == 10 && dia >= 5 && dia <= 14)
            return false; //é falso pq foi desse ano que juliano cortou alguns dias naquele ano
        if (dia < 1 || dia > 31 || mes < 1 || mes > 12)
            return false; // é falso pq não existe mais de 31 dias e nem 12 meses, e também não tem menos de 1 dia e nem 1 mes
        if (dia > 30 && (mes == 4 || mes == 6 || mes == 9 || mes == 11))
            return false; // é falso pq nesses meses os dias vão até 30 dias, não 31
        if (dia > 29 && mes == 2)
            return false; // é falso pq fev não tem 29 dias em ano normal
        if (dia > 29 && mes == 2 && !Data.isBissexto(ano))
            return false; // é falso pq em fev não tem em ano bissexto TEM 29 dias em fev
            
        return true;
    }

    public Data (byte dia, byte mes, short ano) {
        if (!Data.isValida(dia, mes, ano))
            throw new Exception ("Data Inválida");
        
        this.dia = dia;
        this.mes = mes;
        this.ano = ano;
    } 

    public void setDia (byte dia) throws Exception {
        if (!Data.isValida(dia, this.mes, this.ano))
            throw new Exception ("Data Inválida");
        this.dia = dia;
    }

    public byte getDia () {
        return this.dia;
    }
}
