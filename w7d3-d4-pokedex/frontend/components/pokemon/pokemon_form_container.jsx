import { connect } from 'react-redux';
import PokemonForm from './pokemon_form.jsx';
import { createNewPokemon } from '../../actions/pokemon_actions.js';

const mapStateToProps = state => ({
  errors: state.errors
});

const mapDispatchToProps = (dispatch) => ({
  createNewPokemon: (pokemon) => dispatch(createNewPokemon(pokemon))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonForm);
