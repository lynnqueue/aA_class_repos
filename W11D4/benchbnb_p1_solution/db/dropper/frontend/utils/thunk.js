// ES5 Style
export const thunk = function(store) {
  // debugger
  return function(next) { // `next` refers to the next middleware or the root reducer if there is no next middleware
    // debugger
    return function(action) {
      // debugger
      // this is the function that gets invoked and receives the action when calling `store.dispatch`
      if (typeof action === "function") {
        // debugger
        return action(store.dispatch, store.getState);
      }
      // debugger
      return next(action);
    };
  };
};

// ES6 Style
export const thunk1 = (store) => (next) => (action) => {
  if (typeof action === "function") {
    return action(store.dispatch, store.getState);
  }

  return next(action);
};