import React from 'react';
import ReactDOM from 'react-dom';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {index: 0};
    this.updateIndex = this.updateIndex.bind(this);
  }

  updateIndex(idx) {
    return ()=> this.setState({index: idx});
  }

  makeList() {
    return this.props.tabArray.map((tab,idx)=>{
      return <li key={idx} onClick={this.updateIndex(idx)}>{tab.title}</li>;
    });

  }


  render() {
    console.log(this.state.index);
    return(
      <div className="tab" >
        <ul>
          {this.makeList()}
        </ul>
        <article><p>{this.props.tabArray[this.state.index].content}</p></article>
      </div>
    );
  }
}

export default Tabs;
