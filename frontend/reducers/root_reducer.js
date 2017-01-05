import pokemonReducer from './pokemon_reducer.js';
import pokemonDetailReducer from './pokemon_detail_reducer.js';

import { combineReducers } from 'redux';

const rootReducer = combineReducers({
  pokemon: pokemonReducer,
  pokemonDetail: pokemonDetailReducer
});

export default rootReducer;
