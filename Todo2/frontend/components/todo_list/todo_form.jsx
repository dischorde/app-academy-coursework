import React from 'react';
import uniqueId from '../../util/util.js';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      title: '',
      body: ''
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateInput = this.updateInput.bind(this);
    this.makeTodo = this.makeTodo.bind(this);
  }

  handleSubmit(e){
    e.preventDefault();
    this.props.createTodo(this.makeTodo()).then(
      () => this.setState({ title: "", body: "" })
    );
  }

  updateInput(type) {
    return (e) => {
      this.setState({
        [type]: e.target.value
      });
    };
  }

  makeTodo() {
    let newTodo = {
      todo: {
        id: uniqueId(),
        title: this.state.title,
        body: this.state.body,
        done: false
      }
    };

    return newTodo;
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>Title:{'   '}
          <input
            type='text'
            onChange={this.updateInput('title')}
            value={this.state.title}>
          </input>
        </label>

        <br />

        <label>Body:{'   '}
          <input
            type='text'
            onChange={this.updateInput('body')}
            value={this.state.body}>
          </input>
        </label>

        <br />

        <button>Add Todo</button>
      </form>
    );
  }
}

export default TodoForm;
