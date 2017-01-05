import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import Root from './components/root.jsx';
import { fetchPokemon } from './util/api_util.js';
import { requestSinglePokemon, createNewPokemon } from './actions/pokemon_actions.js';


document.addEventListener('DOMContentLoaded', () => {
  window.fetchPokemon = fetchPokemon;
  window.requestSinglePokemon = requestSinglePokemon;
  window.createNewPokemon = createNewPokemon;
  const store = configureStore();
  window.store = store;
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, rootEl);
});
