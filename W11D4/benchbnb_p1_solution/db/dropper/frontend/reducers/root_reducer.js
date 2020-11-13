import { combineReducers } from 'redux';
import dropsReducer from './drops_reducer';
import usersReducer from './users_reducer';

const rootReducer = combineReducers({
  drops: dropsReducer,
  users: usersReducer
});

export default rootReducer