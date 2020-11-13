import * as APIUtil from '../utils/drops_api_util';

export const RECEIVE_DROP = "RECEIVE_DROP";
export const RECEIVE_ALL_DROPS = "RECEIVE_ALL_DROPS";

// regular action creator, returns a regular action POJO
export const receiveDrop = (drop) => {
  // debugger
  return {
    type: RECEIVE_DROP,
    drop
  };
};

export const receiveAllDrops = ({drops, users}) => {
  // debugger
  return {
    type: RECEIVE_ALL_DROPS,
    drops: drops,
    users: users
  };
};


// thunk action creators
// returns an inner function instead that fires off the AJAX request
export const fetchAllDrops = () => {
  // debugger
  return (dispatch) => {
    // debugger
    // launch AJAX request
    // chain on `.then`
    return APIUtil.fetchAllDrops().then(payload => {
      // debugger
      // use `payload` as argument name because now returning more than drops
      // when promise fufilled, dispatch a regular action creator to store
      return dispatch(receiveAllDrops(payload));
    })
  }
}

export const createDrop = (drop) => {
  // debugger
  return (dispatch) => {
    // debugger
    // launch AJAX request to create drop
    return APIUtil.createDrop(drop).then(newDrop => {
      // debugger
      // once successful, add newly created drop to our redux store through dispatch
      return dispatch(receiveDrop(newDrop));
    })
  }
}

export const fetchDrop = (dropId) => {
  return (dispatch) => {
    return APIUtil.fetchDrop(dropId).then(drop => {
      return dispatch(receiveDrop(drop));
    });
  };
};