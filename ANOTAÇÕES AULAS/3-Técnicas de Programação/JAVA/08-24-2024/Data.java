public class Data {
    private byte  dia, mes;
    private short ano;

    public static boolean isBissexto (short ano)
    {
        // Calendario Juliano
        if (ano<1582)
            if (ano%4==0)
                return true;
            else
                return false;

        // Calendario Gregoriano
        if (ano%400==0) 
            return true;
        if (ano%  4==0 && ano%100!=0) 
            return true;
        return false;
    }

    public static boolean isValida (byte dia, byte mes, short ano) {
        if (ano<-45) 
            return false; 
        if (ano== 0) 
            return false;
        if (ano==1582 && mes==10 && dia>=5 && dia<=14) 
            return false;

        if (dia<1 || dia>31 || mes<1 || mes>12) 
            return false;

        if (dia>30 && (mes==4 || mes==6 || mes==9 || mes==11)) 
            return false;
        if (dia>29 && mes==2) 
            return false;
        if (dia>28 && mes==2 && !Data.isBissexto(ano)) 
            return false;

        return true;
    }

    public Data (byte dia, byte mes, short ano) throws Exception {
        if (!Data.isValida(dia,mes,ano))
            throw new Exception ("Data invalida");

        this.dia=dia;
        this.mes=mes;
        this.ano=ano;
    }

    public void setDia (byte dia) throws Exception {
        if (!Data.isValida(dia,this.mes,this.ano))
            throw new Exception ("Dia invalido");

        this.dia=dia;
    }

    public byte getDia () {
        return this.dia;
    }
    
    public void setMes (byte mes) throws Exception {
        if (!Data.isValida(this.dia,mes,this.ano))
            throw new Exception ("Mes invalido");

        this.mes=mes;
    }

    public byte getMes () {
        return this.mes;
    }
    
    public void setAno (short ano) throws Exception {
        if (!Data.isValida(this.dia,this.mes,ano))
            throw new Exception ("Ano invalido");

        this.ano=ano;
    }

    public short getAno () {
        return this.ano;
    }

    public Data getDiaSeguinte () {
        if (this.ano==1582 && this.mes==10 && this.dia==4) { 
            try {
            return new Data ((byte)15,(byte)10,(short)1582);
            } 
            catch (Exception erro1) {}
        } 
        else if (this.ano==-1 && this.mes==12 && this.dia==31) { 
            try {
                return new Data ((byte)1,(byte)1,(short)1);
            } 
            catch (Exception erro2){}} 
        else { 
            try {
                return new Data (this.dia+1,this.mes,this.ano);
            } 
            catch (Exception erro3) { 
                try {
                    return new Data ((byte)1,this.mes+1,this.ano);
                } 
                catch (Exception erro4) { 
                    try {
                        return new Data ((byte)1,(byte)1,this.ano+1);
                    } 
                    catch (Exception erro4) {}
                }
            }
        }
    }

    public Data getVariosDiasAdiante (int qtd) throws Exception {
        // faça
    }

    public Data getDiaAnterior () {
        // faça
    }

    public Data getVariosDiasAtras (int qtd) throws Exception {
        // faça
    }
}
