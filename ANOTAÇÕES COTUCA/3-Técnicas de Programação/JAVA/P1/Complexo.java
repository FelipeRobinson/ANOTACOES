public class Complexo {
    // toda variável matemática, adicione a class DOUBLE
    private double a, b;
    
    public /* void */ Complexo(double a, double b) {
        this.a = a;
        this.b = b;
    }

    public Complexo somar(Complexo x) throws Exception {
        if (x == null) throw new Exception ("2o Operando ausente");
        return new Complexo (this.a + x.a, this.b + x.b);
    }

    public Complexo subtrair(Complexo x) throws Exception {
        if (x == null) throw new Exception ("2o Operando ausente");
        return new Complexo (this.a - x.a, this.b - x.b);
    }

    public Complexo multiplicacao(Complexo x) throws Exception {
        if (x == null) throw new Exception ("2o Operando ausente");
        return new Complexo (this.a * x.a, this.b * x.b);
    }

    public Complexo divisao(Complexo x) throws Exception {
        if (x == null) 
            throw new Exception ("2o Operando ausente");
        if (x.a == 0 && x.b == 0) 
            throw new Exception("Divisão por zero");
            
        return new Complexo ((this.a * x.a + this.b * x.b) / (Math.pow(x.a, 2) + Math.pow(x.b, 2)), (x.a * this.b - this.a * x.b) / (Math.pow(x.a, 2) + Math.pow(x.b, 2)));
    }

    @Override
    public String toString() {
        if (this.a == 0 && this.b == 0)
            return "0";
        if (this.a == 0)
            return this.b + "i";
        if (this.b == 0)
            return "" + this.a;
        if (this.b > 0)
            return this.a + "+" +  this.b + "i";
        
        return this.a + (this.b + "i");
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this)
            return true;
        if (obj == null)
            return false;
        if (obj.getClass() != this.getClass())
            return false;
        Complexo cpx = (Complexo)obj;
        if (this.a != cpx.a)
            return false;
        if (this.b != cpx.b)
            return false;
        return true;
    }

    @Override
    public int hashCode() {
        int ret = 1 /* um positivo qualquer */;

        ret = ret * 2 /* um primo qualquer */ + ((Double)this.a).hashCode();
        ret = ret * 2 /* um primo qualquer */ + ((Double)this.b).hashCode();

        if (ret < 0)
            return ret = -ret;
        return ret;
    }
}