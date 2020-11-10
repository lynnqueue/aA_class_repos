import React from 'react';
import ReactDOM from 'react-dom';
import { RECEIVE_ALL_POKEMON } from './actions/pokemon_actions';
import * as APIUtil from './util/api_util'

document.addEventListener('DOMContentLoaded', () => {
    const rootEl = document.getElementById('root');
    ReactDOM.render(<h1>Pokedex</h1>, rootEl);

    window.RECEIVE_ALL_POKEMON = RECEIVE_ALL_POKEMON;
    window.APIUtil.fetchAllPokemon = APIUtil.fetchAllPokemon;
});