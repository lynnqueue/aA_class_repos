import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import App from './components/app';
import { receiveDrop } from './actions/drops_actions';

// const defaultState = {
//     drops: {
//         1: {
//             id: 1,
//             body:
//                 'Hey Programmers!',
//             author_id: 1,
//         },
//         2: {
//             id: 2,
//             body:
//                 "Look at me... I'm the Peter now",
//             author_id: 2,
//         },
//         3: {
//             id: 3,
//             body:
//                 "We all miss Peter",
//             author_id: 3,
//         },
//     },
//     users: {
//       1: {
//         id: 1,
//         username: "Peter"
//       },
//       2: {
//         id: 2,
//         username: "Rich"
//       },
//       3: {
//         id: 3,
//         username: "Andy"
//       },
//     }
// };

document.addEventListener("DOMContentLoaded", () => {
    // debugger
    const root = document.getElementById('content');
    
    const store = configureStore();
    
    //TESTING
    window.store = store;
    window.receiveDrop = receiveDrop;
    
    ReactDOM.render(<App store={store}/>, root);
})
// debugger