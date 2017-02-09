import { connect } from 'react-redux';
import ItemDetail from './item_detail.jsx';
import { selectPokemonItem } from '../../reducers/selector.js';

const mapStateToProps = (state, ownProps) => ({
  item: selectPokemonItem(state, ownProps.params.itemId)
});

const mapDispatchToProps = (dispatch) => ({

});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ItemDetail);
