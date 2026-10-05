calcular.addEventListener('click', function() {
            let numero = parseInt(document.getElementById('numero').value);
            let resultado = 1;

            for (let i = 1; i <= numero; i++) {
                resultado *= i;
            }

            document.getElementById('resultado').textContent = resultado;
        })