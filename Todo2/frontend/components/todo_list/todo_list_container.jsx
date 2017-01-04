import { connect } from 'react-redux';
import TodoList from './todo_list.jsx';
import allTodos from '../../reducers/selectors.js';
import { createTodo, destroyTodo, fetchTodos, updateTodo } from '../../actions/todo_actions.js';

const mapStateToProps = state => ({
  todos: allTodos(state),
  errors: state.errors
});

const mapDispatchToProps = dispatch => ({
  createTodo: (todo) => dispatch(createTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos()),
  updateTodo: (todo) => dispatch(updateTodo(todo)),
  destroyTodo: (id) => dispatch(destroyTodo(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
