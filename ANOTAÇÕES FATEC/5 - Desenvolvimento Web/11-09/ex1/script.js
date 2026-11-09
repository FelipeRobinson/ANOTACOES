function hoje() {
    var agora = new Date();
    return (agora.getDate() + "/" + 
    (agora.getMonth() + 1) + "/" + agora.getFullYear());
};

window.addEventListener('load', function () {
    let produto = {
        codigo: 10,
        descricao: "Televisor",
        preco: 1990.00,
        data: function() { return hoje(); }
    };

    res.innerHTML = "Dados:" +
    "<br>Código: " + produto.codigo +
    "<br>Descrição: " + produto.descricao +
    "<br>Preço: " + produto.preco +
    "<br>Data: " + produto.data();  
});