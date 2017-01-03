import * as TodoAPIUtil from '../util/todo_api_util';

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

export const receiveTodo = todo => ({
  type: RECEIVE_TODO,
  todo
});

export const receiveTodos = todos => ({
  type: RECEIVE_TODOS,
  todos
});

export const removeTodo = id => ({
  type: REMOVE_TODO,
  id
});

export const fetchTodos = () => dispatch => (
  TodoAPIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
);

export const createTodo = item => dispatch => (
  TodoAPIUtil.createTodo(item).then(todo => dispatch(receiveTodo(todo)))
);
