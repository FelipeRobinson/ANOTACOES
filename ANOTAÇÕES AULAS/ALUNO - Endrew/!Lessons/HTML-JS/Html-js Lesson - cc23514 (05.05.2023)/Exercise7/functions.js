function clickL(value) {
    const screen = document.getElementById('screen');
    screen.value += value;
  }

function CE() {
    const screen = document.getElementById('screen');
    screen.value = '';
  }


function Cryptography1(text) {

  const caracteres = {
    'a': '1','b': '2','c': '3','d': '4',
    'e': '5','f': '6','g': '7','h': '8',
    'i': '9','j': '10','k': '11','l': '12',
    'm': '13','n': '14','o': '15','p': '16',
    'q': '17','r': '18','s': '19','t': '20',
    'u': '21','v': '22','w': '23','x': '24',
    'y': '25','z': '26'
    }

  let Cryptography = '';
  
  for (let i = 0; i < text.length; i++) {
    const letter = text[i].toLowerCase();
    const replace = caracteres[letter] || letter;
    Cryptography += replace;
    }

    alert(Cryptography);

  }

function Cryptography2(text) {
  let Cryptography = '';
  for (var i = text.length - 1; i >= 0; i--) {
    Cryptography += text[i];
    }

  alert(Cryptography);

  }