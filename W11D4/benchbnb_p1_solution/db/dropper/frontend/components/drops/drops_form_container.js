import { connect } from 'react-redux';
import { createDrop } from '../../actions/drops_actions';
import DropForm from './drops_form';

const msp = (state, ownProps) => {
  // console.log(ownProps);
  // own props here would be the apple & banana inline props from app.jsx
  return {};
}

const mapDispatchToProps = dispatch => {
  // debugger
  return {
    addDrop: drop => { 
    //   debugger
      return dispatch(createDrop(drop))
    }
  }
};

// drops form functionality is to add new drops to the database so it needs `dispatch` to update the redux global state

export default connect(msp, mapDispatchToProps)(DropForm); 