public class Circulo {
    private float raio;
    private float[] Centro;

    public Circulo(float raio, float Centro) {
        setR(raio);
        setCentro(Centro);
    }

    public float getComprimento(Angulo o) {
        // o ângulo central (o) já vem em RADIANOS quando chamado o método getValroEmRadianos da classe Angulo
        return this.raio * o;
    }

    public getArea (Angulo o) {
        // o ângulo central (o) já vem em RADIANOS quando chamado o método getValroEmRadianos da classe Angulo
        return (this.raio * this.raio) * 0.5 * o;
    }

    public float getRaio () {
        return this.raio;
    }

    public float[] getCentro () {
        return this.Centro;
    }

    public void setRaio (float raio) throws Exception {
        if (raio < 0) throw new Exception ("RAIO NÃO PODE SER NEGATIVO!");
        this.raio = raio;
    }

    public void setCentro(float h, float k) {
        this.Centro = new float[] { h, k };
    }



    public equals() {

    }

    public toString() {

    }

    public hashCode() {

    }

}