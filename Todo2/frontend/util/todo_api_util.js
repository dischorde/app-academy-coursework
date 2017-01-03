export const fetchTodos = () => {
  return $.ajax({
    method: 'GET',
    url: 'api/todos'
  });
};

export const createTodo = (todo) => {
  debugger;
  return $.ajax({
    method: 'POST',
    url: 'api/todos',
    data: todo
  });
};
