import React from 'react';
import ReactDOM from 'react-dom';
import Tabs from './tabs';
import Clock from './clock';
import Weather from './weather';

const tabProperties = [{title: "first" , content: "this is the first" },
                      {title: "second" , content: "this is the second" }];
class Root extends React.Component {
  constructor() {
    super();
  }

  render() {
    console.log(tabProperties);
    return(
      <div>
        <Tabs tabArray={tabProperties}/>
        <Clock />
        <Weather />
      </div>
    );
  }
}

export default Root;
