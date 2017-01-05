import React from 'react';
import PokemonIndexItem from './pokemon_index_item.jsx';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const { pokemon } = this.props;
    const pokemonItems = pokemon.map(poke => <PokemonIndexItem id={poke.id} pokemon={poke} />);
    return (
      <section className="pokedex">
        <ul>
           {pokemonItems}
        </ul>
      </section>
    );
  }
}

export default PokemonIndex;
