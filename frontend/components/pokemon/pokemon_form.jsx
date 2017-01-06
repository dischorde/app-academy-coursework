import React from 'react';

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "",
      attack: "",
      defense: "",
      poke_type: "",
      moves: [],
      image_url: ""
    };
    this.update = this.update.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    console.log(e);
    e.preventDefault();
    this.props.createNewPokemon({pokemon: this.state});
    this.setState({
      name: "",
      attack: "",
      defense: "",
      poke_type: "",
      moves: [],
      image_url: ""
    });
  }

  update(property) {
    switch(property) {
      case "moves":
        return e => {
          return this.setState({moves: e.target.value.split(", ")});
        };
      default:
        return e => this.setState({[property]: e.target.value});
    }
  }

  render () {
    const types = [
      "fire",
      "electric",
      "normal",
      "ghost",
      "psychic",
      "water",
      "bug",
      "dragon",
      "grass",
      "fighting",
      "ice",
      "flying",
      "poison",
      "ground",
      "rock",
      "steel"
    ];

    return (
      <section>
        <h3>Create New Pokemon</h3>
        <form onSubmit={this.handleSubmit}>
          <input onChange={this.update('name')} key="new-name" placeholder="Name" value={this.state.name}></input>
          <br />
          <input onChange={this.update('image_url')} key="new-img" placeholder="Image Url" value={this.state.image_url}></input>
          <br />
          <select onChange={this.update('poke_type')} key="new-type" >
            <option key="default" selected disabled>{"Choose a Type!"}</option>
            {types.map((type) => <option key={type} value={type}>{type}</option>)}
          </select>
          <br />
          <input onChange={this.update('attack')} key="new-attack" placeholder="Attack" value={this.state.attack}></input>
          <br />
          <input onChange={this.update('defense')} key="new-defense" placeholder="Defense" value={this.state.defense}></input>
          <br />
          <input onChange={this.update('moves')} key="new-moves" placeholder="Moves" value={this.state.moves.join(", ")}></input>
          <br />
          <button>Submit</button>
        </form>
      </section>
    );
  }
}

export default PokemonForm;
