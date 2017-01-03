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
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.makeTodo = this.makeTodo.bind(this);
  }

  handleSubmit(e){
    e.preventDefault();
    this.props.receiveTodo(this.makeTodo());
    this.setState({
      title: '',
      body: ''
    });
  }

  updateTitle(e) {
    this.setState({
      title: e.target.value
    });
  }

  updateBody(e) {
    this.setState({
      body: e.target.value
    });
  }

  makeTodo() {
    return {
      id: uniqueId(),
      title: this.state.title,
      body: this.state.body,
      done: false
    };
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>Title:
          <input
            type='text'
            onChange={this.updateTitle}
            value={this.state.title}>
          </input>
        </label>

        <br />

        <label>Body:
          <input
            type='text'
            onChange={this.updateBody}
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
