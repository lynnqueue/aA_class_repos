import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import { thunk, thunk1 } from '../utils/thunk';
import logger from 'redux-logger';


export default (preloadedState = {}) => {
  return createStore(
    rootReducer, 
    preloadedState, 
    applyMiddleware(thunk, logger)
  );
}; 