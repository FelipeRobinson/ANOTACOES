function clickL(value) {
  const screen = document.getElementById('screen');
  screen.value += value;
}


function CE() {
  const screen = document.getElementById('screen');
  screen.value = '';
}

function Cryptography1() {
  const screen = document.getElementById('screen');
  const text = screen.value;
  const caracteres = {
      'a': '@', 'e': '%', 'i': '#', 'u': 'XX'
  };
  var Cryptography = '';  
  for (var i = 0; i < text.length; i++) {
      const letter = text[i].toLowerCase();
      const replace = caracteres[letter] || letter;
      Cryptography += replace;
  }
  screen.value = Cryptography;
}

function Cryptography2() {
  const screen = document.getElementById('screen');
  const text = screen.value;
  const caracteres = {
      'a': '11', 'b': '24', 'c': '367', 'd': '24', 'e': '415', 'f': '56', 'g': '57', 'h': '88', 'i': '29',
      'j': '10', 'k': '11', 'l': '12', 'm': '13', 'n': '14', 'o': '15', 'p': '136', 'q': '171','ç':'f',
      'r': '18', 's': '19', 't': '20', 'u': '21', 'v': '22', 'w': '23', 'x': '24', 'y': '25', 'z': '26'
  };
  var Cryptography = '';
  for (var i = 0; i < text.length; i++) {
      const letter = text[i].toLowerCase();
      const replace = caracteres[letter] || letter;
      Cryptography += replace;
  }
  screen.value = Cryptography;
}