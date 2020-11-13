const { RECEIVE_DROP, RECEIVE_ALL_DROPS } = require("../actions/drops_actions");


const dropsReducer = (state = {}, action) => {
  Object.freeze(state);

  let newState = {};
  switch (action.type) {
    case RECEIVE_DROP:
      // debugger
      const { drop } = action;
      newState = Object.assign(
        {},
        state,
        { [drop.id]: drop }
      );

      return newState;
  
    case RECEIVE_ALL_DROPS:
      // debugger
      // action.drops.forEach(drop => {
      //   newState[drop.id] = drop;
      // });
      // we don't have to do this ^ anymore because our jbuilder helps us shape the state

      return action.drops;

    default:
      return state;
  }
};

export default dropsReducer;