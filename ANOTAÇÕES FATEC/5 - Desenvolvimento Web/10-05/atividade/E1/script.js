btCal.addEventListener("click", calcular);


function calcular() {
    const l1 = parseFloat(lado1.value);
    const l2 = parseFloat(lado2.value);
    res.value = l1 * l2;

    const isQuadrado = l1 === l2;

    imgQuadrado.style.display  = isQuadrado ? "block" : "none";
    imgRetangulo.style.display = isQuadrado ? "none" : "block";
}