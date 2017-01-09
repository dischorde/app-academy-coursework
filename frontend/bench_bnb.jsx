
import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import {login, logout, signup} from './util/session_api_util.js';


document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');
    window.signup = signup;
    window.login = login;
    window.logout = logout;
    window.store = configureStore();
    ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});
