import { connect } from 'react-redux';
import DropsIndex from './drops_index';
import { fetchAllDrops } from '../../actions/drops_actions';

const mapStateToProps = (state) => {
  // debugger
  return {
    drops: Object.values(state.drops),
    users: state.users
  }
};

const mapDispatchToProps = (dispatch) => {
  // debugger
  return {
    fetchAllDrops: () => {
      // debugger
      return dispatch(fetchAllDrops())
    }
  }
}

// connect invoked returns a new function that will build a component and `subscribe` to the store, listening for redux state changes
const connectingFunc = connect(mapStateToProps, mapDispatchToProps);

// pass this `connectingFunc` a presentational component to connect the container to it so it can pass the props down to it
const connectedComponent = connectingFunc(DropsIndex);

export default connectedComponent;
