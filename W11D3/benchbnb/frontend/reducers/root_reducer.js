import entitesReducer from './entities_reducer';
import sessionReducer from './session_reducer';
import errorsReducer from './errors_reducer'
import { combineReducer } from 'redux';

export default combineReducer({
    entities: entitesReducer,
    session: sessionReducer,
    errors: errorsReducer,
})