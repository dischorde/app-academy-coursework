
import React from 'react';
import ReactDOM from 'react-dom';
// import {login, logout, signup} from './util/session_api_util.js';


document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');
    // window.signup = signup;
    // window.login = login;
    // window.logout = logout;
    ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});
