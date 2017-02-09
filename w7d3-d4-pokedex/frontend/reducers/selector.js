import values from 'lodash/values';

export const selectAllPokemon = (state) => {
  return values(state.pokemon);
};

export const selectPokemonItem = (state, id) => {
  const { pokemonDetail } = state;
  const foundItem = (pokemonDetail.items === undefined ? {} : pokemonDetail.items.find(item => item.id === +id));
  return foundItem;
};
