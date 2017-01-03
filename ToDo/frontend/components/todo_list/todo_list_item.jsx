import React from 'react';

const todoListItem = (props) => (
    <li key={props.idx}>{props.todo.title}</li>
  );

export default todoListItem;
