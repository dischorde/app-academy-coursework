import { connect } from 'react-redux';
import { requestSinglePokemon } from '../../actions/pokemon_actions.js';
import PokemonDetail from './pokemon_detail.jsx';

const mapStateToProps = state => ({
  pokemonDetail: state.pokemonDetail
});

const mapDispatchToProps = (dispatch) => ({
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
