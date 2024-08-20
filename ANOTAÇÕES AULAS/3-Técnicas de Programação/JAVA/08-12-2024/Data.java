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

    /*ESSE É O CONSTRUTOR*//*MESMO NOME DA CLASSE*/
    public Data (byte dia, byte mes, short ano) throws Exception{
        if (!Data.isValida(dia, mes, ano))
            throw new Exception ("Data Inválida");
        
        this.dia = dia;
        this.mes = mes;
        this.ano = ano;
    } 
    
    
    /*SELECIONANDO E SETANDO DIA*/
    public void setDia (byte dia) throws Exception {
        if (!Data.isValida(dia, this.mes, this.ano))
            throw new Exception ("Data Inválida");
        this.dia = dia;
    }

    public byte getDia () {
        return this.dia;
    }
    
    
    /*SELECIONANDO E SETANDO MES*/
    public void setMes (byte mes) throws Exception {
        if (!Data.isValida(this.dia, mes, this.ano))
            throw new Exception ("Data Inválida");
        this.mes = mes;
    }

    public byte getMes () {
        return this.mes;
    }
    
    
    /*SELECIONANDO E SETANDO ANO*/
    public void setAno (short ano) throws Exception {
        if (!Data.isValida(this.dia, this.mes, ano))
            throw new Exception ("Data Inválida");
        this.ano = ano;
    }

    public short getAno () {
        return this.ano;
    }
    
    // Ele tera que fazer o dia para mais um, porém se o dia passar de 31 ele deve voltar ao um, e se o mes passsar do 12, ele deve voltar ao 1

    public static int proximoDia (byte dia, byte mes, short ano) {
        if (dia == 31)
            return dia =+ '1';
        if (dia == 31 && mes == 12)
            return dia =+ '1'; 
            return mes = '1';
        if (mes == 2 && dia == 28)
            return mes + 1;
            return dia = '1';
        if (mes == 4 || mes == 6 || mes == 9 || mes == 11 && dia == 30)
            return mes + 1;
            return dia = '1';
        if (ano % 4 == 0)
            if (dia == 31)
                return dia =+ '1';
            if (dia == 31 && mes == 12)
                return dia =+ '1'; 
                return mes = '1';
            if (mes == 2 && dia == 28)
                return mes + 1;
                return dia = '1';
            if (mes == 4 || mes == 6 || mes == 9 || mes == 11 && dia == 30)
                return mes + 1;
                return dia = '1';
            else
                dia + 1
        else
            dia + 1;
    }
}