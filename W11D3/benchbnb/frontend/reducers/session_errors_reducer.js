import { RECEIVE_SESSION_ERRORS, RECEIVE_CURRENT_USER } from '../actions/session_actions.js';

function sessionErrorsReducer(state = {}, action) {
    Object.freeze(state);
    switch (action.type) {
        case (RECEIVE_CURRENT_USER):
            action
        case (RECEIVE_SESSION_ERRORS):

        default:
            return state;
    }
}


export default sessionErrorsReducer;