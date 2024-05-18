function conferirDados() {
    let certo_nome = document.getElementById("NOME");
    let tamanho_max = 20; 

    if (certo_nome.value.length > tamanho_max) {
        alert("O tamanho do seu nome é muito grande.");
    }

    let certo_ra = document.getElementById("RA");
    let tamanho_ra = 5;
    if (certo_ra.value === "") {
        alert("Por favor, preencha o RA.");
    } else if (certo_ra.value.length !== tamanho_ra) {
        alert("O RA deve conter 5 números.");
    }

    let certo_idade = document.getElementById("IDADE");
    let tamanho_idade = 2;
    if (certo_idade.value.length !== tamanho_idade) {
        alert("Informe corretamente sua idade.");
    }
}