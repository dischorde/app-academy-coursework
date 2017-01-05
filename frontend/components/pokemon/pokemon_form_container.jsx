import { connect } from 'react-redux';
import PokemonForm from './pokemon_form.jsx';
import { createPokemon } from '../../actions/pokemon_actions.js';

const mapStateToProps = state => ({

});

const mapDispatchToProps = (dispatch) => ({
  createPokemon: (pokemon) => dispatch(createPokemon(pokemon))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonForm);
