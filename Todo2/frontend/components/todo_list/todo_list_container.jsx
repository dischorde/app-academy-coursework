import { connect } from 'react-redux';
import TodoList from './todo_list.jsx';
import allTodos from '../../reducers/selectors.js';
import { createTodo, removeTodo, fetchTodos } from '../../actions/todo_actions.js';

const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  createTodo: (todo) => dispatch(createTodo(todo)),
  removeTodo: (id) => dispatch(removeTodo(id)),
  fetchTodos: () => dispatch(fetchTodos())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
