import React from 'react';
import { Link } from 'react-router';

class PokemonIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render () {
    const {id, pokemon} = this.props;
    return (
      <li>
        <Link to={`/pokemon/${id}`}>
          {pokemon.name} <img className="small" src={pokemon.image_url}></img>
        </Link>
      </li>
    );
  }

}

export default PokemonIndexItem;
