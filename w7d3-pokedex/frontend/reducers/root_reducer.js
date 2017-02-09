import PokemonReducer from './pokemon_reducer.js';
import PokemonDetailReducer from './pokemon_detail_reducer.js';
import ErrorsReducer from './errors_reducer.js';

import { combineReducers } from 'redux';

const rootReducer = combineReducers({
  pokemon: PokemonReducer,
  pokemonDetail: PokemonDetailReducer,
  errors: ErrorsReducer
});

export default rootReducer;
