function fetchKantoPokemon(){
  fetch(‘https://pokeapi.co/api/v2/pokemon?limit=151')
  .then(response => response.json())
  .then(allpokemon => console.log(allpokemon))
}