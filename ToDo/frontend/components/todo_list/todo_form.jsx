import React from 'react';


class todoForm extends React.Component {
  constructor(props) {
    super(props);
    this.addTodoItem = this.addTodoItem.bind(this);
    this.state = { newTodo: null };
  }

  addTodoItem(e) {

  }

  render() {
    return (
      <form onSubmit={this.addTodoItem}>
        <input></input>
      </form>
    );
  }
}
