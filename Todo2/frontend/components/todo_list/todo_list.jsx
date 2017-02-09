import React from 'react';
import TodoListItem from './todo_list_item.jsx';
import TodoForm from './todo_form.jsx';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  render() {
    return(
      <div>
        <ul>
          {
            this.props.todos.map((todo, i) =>
            <TodoListItem
              key={i}
              destroyTodo={this.props.destroyTodo}
              updateTodo={this.props.updateTodo}
              todo={todo}
            />)
          }
        </ul>
        <TodoForm createTodo={this.props.createTodo} errors={this.props.errors} />
      </div>
    );
  }
}

export default TodoList;
