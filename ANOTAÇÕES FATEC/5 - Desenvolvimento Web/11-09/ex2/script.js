window.addEventListener('load', carregar);
 
function carregar() {
    var produtos = [
        { codigo: 11, descricao: "Geladeira", preco: 2990.00 },
        { codigo: 12, descricao: "Fogão", preco: 840.00 },
        { codigo: 13, descricao: "Computador", preco: 3500.00 }
    ];

    res.innerHTML = "Produtos cadastrados:";
    
    for (var i = 0; i < produtos.length; i++) {
        res.innerHTML += `<p> Código: ${produtos[i].codigo}
            <br>Descrição: ${produtos[i].descricao}
            <br>Preço: ${produtos[i].preco}
            </p>`;
    }
}