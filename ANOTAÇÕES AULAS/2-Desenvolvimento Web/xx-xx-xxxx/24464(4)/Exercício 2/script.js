function conferirDados() {
    var certo_nome = document.getElementById("NOME");
    var tamanho_max = 40; 
    if (certo_nome.value === "") {
        alert("Não pode ficar em branco o sue nome lindeza!") 
    }
    else if (certo_nome.value.length > tamanho_max) {
        alert("Teu nome não tem mais de 40 varra né pae...");
    }

    var certo_ra = document.getElementById("RA");
    var tamanho_ra = 5;
    var justnumb = /^\d+$/;
    if (certo_ra.value === "") {
        alert("Teu RA também não pode ficar em branco!");
    } 
    else if (!justnumb.test(certo_ra.value)) {
        alert("Teu RA só pode ter números")
    }
    else if (certo_ra.value.length !== tamanho_ra) {
        alert("TÁ DE PALHAÇADA NÉ... JÁ ESTÁ NO CURSO A MILENIOS E NÃO SABE QUE O RA TEM CINCO DIGITOS...");
    }

    var certo_idade = document.getElementById("IDADE");
    if (certo_idade.value.length > 3 ){
        alert("MEU DEUS coloca sua idade direito inergumeno!");
    }
    else if (certo_idade.value === "") {
        alert("Precisamos da sua idade brow!!")
    }

    var certo_email = document.getElementById("EMAIL");
    var necessita = /@.*\..*/;
    if (certo_email.value === "") {
        alert("Precisa de um email, mano...");
    } 
    else if (!necessita.test(certo_email.value)) {
        alert("Seu email precisa ter '@' e DOIS '.'");
    }
}