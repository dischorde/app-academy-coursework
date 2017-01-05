import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const pokemonDetailReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState = merge({}, state);

  switch(action.type) {
    case RECEIVE_SINGLE_POKEMON:
      return action.pokemon;
    default:
      return state;
  }
};

export default pokemonDetailReducer;
