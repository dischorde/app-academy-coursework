import React from 'react';
import { Provider } from 'react-redux';
import { Router, Route, hashHistory, IndexRoute } from 'react-router';
import PokemonIndexContainer from './pokemon/pokemon_index_container.jsx';
import PokemonDetailContainer from './pokemon/pokemon_detail_container.jsx';
import ItemDetailContainer from './items/item_detail_container.jsx';
import PokemonFormContainer from './pokemon/pokemon_form_container.jsx';

const Root = ({ store }) => (
  <Provider store={ store }>
    <Router history={ hashHistory }>
      <Route path="/" component={ PokemonIndexContainer }>
        <IndexRoute component={ PokemonFormContainer } />
        <Route path="pokemon/:pokemonId" component={PokemonDetailContainer}>
           <Route path="item/:itemId" component={ItemDetailContainer} />
        </Route>
      </Route>
    </Router>
  </Provider>
);

export default Root;
