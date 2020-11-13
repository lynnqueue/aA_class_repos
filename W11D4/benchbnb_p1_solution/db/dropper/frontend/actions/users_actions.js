import * as UserAPIUtil from "../utils/user_api_util";

export const RECEIVE_USER = "RECEIVE_USER";
export const RECEIVE_ALL_USERS = "RECEIVE_ALL_USERS";

export const receiveUser = (user) => {
  return {
    type: RECEIVE_USER,
    user
  }
};

export const receiveAllUsers = (users) => {
  return {
    type: RECEIVE_USER,
    users
  }
};

export const fetchUsers = () => {
    return dispatch => {
        return UserAPIUtil.fetchUsers().then(users => {
            return dispatch(receiveAllUsers(users));
        });
    }
}

export const updateUser = user => {
    //TODO
}
