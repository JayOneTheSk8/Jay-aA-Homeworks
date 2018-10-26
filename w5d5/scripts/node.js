const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBuscuits() {
  reader.question(`Would you like some tea?`, function (teaResponse){
    console.log(`You replied with ${ teaResponse }.`);
    reader.question(`Would you like some buscuits?`, function (buscuitResponse){
      console.log(`You replied with ${ buscuitResponse }.`);
      const wantTea = (teaResponse === 'yes') ? 'do' : 'don\'t';
      const wantBuscuits = (buscuitResponse === 'yes') ? 'do' : 'don\'t';
      console.log(`So you ${ wantTea } want tea and you ${ wantBuscuits } want biscuits.`);
      reader.close();
    });
  });
}
