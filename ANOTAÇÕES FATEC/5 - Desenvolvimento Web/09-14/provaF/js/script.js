const secoes = ['inicio', 'a_disputa', 'seu_contexto', 'c_c', 'atualmente'];

function mostrarSecao(idSecao) {
    secoes.forEach((id) => {
        const secao = document.getElementById(id);
        const botao = document.getElementById('BT' + id);
        const selecionado = id === idSecao;

        secao.hidden = !selecionado;
        botao.setAttribute('aria-pressed', String(selecionado));
    });
}

function inicio() {
    mostrarSecao('inicio');
}

function a_disputa() {
    mostrarSecao('a_disputa');
}

function seu_contexto() {
    mostrarSecao('seu_contexto');
}

function c_c() {
    mostrarSecao('c_c');
}

function atualmente() {
    mostrarSecao('atualmente');
}

mostrarSecao('inicio');
