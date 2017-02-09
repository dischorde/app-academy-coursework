import React from 'react';
import { Link } from 'react-router';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestSinglePokemon(parseInt(this.props.params.pokemonId));
  }

  componentWillReceiveProps(newProps) {
    if (newProps.params.pokemonId !== this.props.params.pokemonId) {
      this.props.requestSinglePokemon(parseInt(newProps.params.pokemonId));
    }
  }

  render() {
    const {image_url, id, attack, defense, name, moves, items, poke_type} = this.props.pokemonDetail;
    let itemLinks = (
      items === undefined ? "" : items.map(item => (
        <Link to={`/pokemon/${id}/item/${item.id}`} key={item.id}>
          <img className="small" src={item.image_url}></img>
        </Link>
      ))
    );

    return (
      <section>
        <img src={image_url}></img>
        <h2>{name}</h2>
        <ul>
          <li key="type">Type: {poke_type}</li>
          <li key="attack">Attack: {attack}</li>
          <li key="defense">Defense: {defense}</li>
          <li key="moves">Moves: {moves === undefined ? "" : moves.join(", ")}</li>
          <li key="items">{itemLinks}</li>
        </ul>
        {this.props.children}
      </section>
    );
  }
}

export default PokemonDetail;
