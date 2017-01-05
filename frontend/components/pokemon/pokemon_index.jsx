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
    const pokemonItems = pokemon.map(poke => (
      <PokemonIndexItem key={poke.id}
                        id={poke.id}
                        pokemon={poke} />
      )
    );

    return (
      <div>
        <section>
          {this.props.children}
        </section>
        <section className="pokedex">
          <ul>
            {pokemonItems}
          </ul>
        </section>
      </div>
    );
  }
}

export default PokemonIndex;
