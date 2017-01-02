import React from 'react';
import TodoListItem from './todo_list_item.jsx';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <ul>
        {
          this.props.todos.map((todo, i) =>  <TodoListItem key={i} todo={todo} />)
        }
      </ul>
    );
  }
}

export default TodoList;
