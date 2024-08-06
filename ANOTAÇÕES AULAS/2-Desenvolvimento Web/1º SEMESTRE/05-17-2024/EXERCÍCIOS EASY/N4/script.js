function conferirDados() {
    let certo_nome = document.getElementById("NOME");
    let tamanho_max = 20; 

    if (certo_nome.value.length > tamanho_max) {
        alert("VAI TOOMA NO CU! OU SEU PAI É UM FILHA DA PUTA OU VOCÊ É BURRO. NINGUEM TEM UM NOME DE MAIS DE 20 CARACTERES");
    }

    let certo_ra = document.getElementById("RA");
    let tamanho_ra = 5;
    if (certo_ra.value === "") {
        alert("PARA DE SER BURRO. COLOCA SEU RA LA PORRA!");
    } else if (certo_ra.value.length !== tamanho_ra) {
        alert("VAI A MERDA NÉ... JÁ ESTÁ NO CURSO A MILENIOS E NÃO SABE QUE O RA TEM CINCO DIGITOS...");
    }

    let certo_idade = document.getElementById("IDADE");
    let tamanho_idade = 2;
    if (certo_idade.value.length !== tamanho_idade) {
        alert("PQP coloca sua idade direito inergumeno!");
    }
}