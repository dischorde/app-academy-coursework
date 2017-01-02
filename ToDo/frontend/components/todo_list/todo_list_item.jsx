import React from 'react';

const todoListItem = (props) => ( <li key={props.key}>{props.todo.title}</li> );

export default todoListItem;
