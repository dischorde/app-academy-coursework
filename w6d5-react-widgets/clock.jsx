import React from 'react';
import ReactDOM from 'react-dom';

class Clock extends React.Component {
  constructor() {
    super();
    this.state = { time: new Date() };
  }

  componentDidMount() {
    setInterval( () => this.setState({time: new Date()}), 1000);
  }

  render() {

    return (
      <div>
        <div>DATE: {this.state.time.toDateString()}</div>
        <div>TIME: {this.state.time.toTimeString()}</div>
      </div>

      );
  }

}


export default Clock;
