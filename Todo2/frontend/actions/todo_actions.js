import * as TodoAPIUtil from '../util/todo_api_util';
import { receiveErrors, clearErrors } from './error_actions';

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

export const removeTodo = todo => ({
  type: REMOVE_TODO,
  todo
});

export const fetchTodos = () => dispatch => (
  TodoAPIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
);

export const createTodo = item => dispatch => (
  TodoAPIUtil.createTodo(item)
  .then(todo => {
            dispatch(receiveTodo(todo));
            dispatch(clearErrors());
          },
             err => dispatch(receiveErrors(err.responseJSON)))
);

export const updateTodo = item => dispatch => (
  TodoAPIUtil.updateTodo(item)
  .then(todo => {
            dispatch(receiveTodo(todo));
            dispatch(clearErrors());
          },
             err => dispatch(receiveErrors(err.responseJSON)))
);

export const destroyTodo = item => dispatch => (
  TodoAPIUtil.destroyTodo(item)
  .then(todo => {
    dispatch(removeTodo(todo));
    dispatch(clearErrors());
  },
  err => dispatch(receiveErrors(err.responseJSON)))
);
