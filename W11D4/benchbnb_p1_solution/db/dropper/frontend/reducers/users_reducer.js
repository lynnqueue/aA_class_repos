import { RECEIVE_ALL_DROPS } from "../actions/drops_actions";
import { RECEIVE_ALL_USERS, RECEIVE_USER } from "../actions/users_actions";

const usersReducer = (state = {}, action) => {
  Object.freeze(state);
  // debugger;
  let newState = {};
  switch (action.type) {
    case RECEIVE_ALL_USERS:
        //TODO;
        
    case RECEIVE_USER:
      const { user } = action;
      newState = Object.assign(
        {},
        state,
        { [user.id]: user }
      );

      return newState;

    case RECEIVE_ALL_DROPS:
      // action.users.forEach(user => {
      //   newState[user.id] = user;
      // });

      return action.users;

    default:
      return state;
  }
};

export default usersReducer;