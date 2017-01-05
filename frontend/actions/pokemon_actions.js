import * as APIUtil from '../util/api_util.js';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_SINGLE_POKEMON = "RECEIVE_SINGLE_POKEMON";

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receiveSinglePokemon = pokemon => ({
  type: RECEIVE_SINGLE_POKEMON,
  pokemon
});

export const requestAllPokemon = () => (dispatch) => {
  return APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
};

export const requestSinglePokemon = (id) => (dispatch) => {
  return APIUtil.fetchPokemon(id)
    .then(pokemon => dispatch(receiveSinglePokemon(pokemon)));
};
