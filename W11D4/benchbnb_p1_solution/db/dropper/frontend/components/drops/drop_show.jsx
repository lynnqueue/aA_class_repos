import React from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { fetchDrop } from '../../actions/drops_actions'

class DropShow extends React.Component {
  // no constructor so React will use React.Component constructor
  // if we only need `super(props)` in the constructor, we can leave it off and rely on the React.Component constructor
  componentDidMount() {
    this.props.fetchDrop(this.props.match.params.dropId);
  }

  componentDidUpdate(prevProps) {
    // prevProps -> props prior to update (react will provide this arg)
    // we need this so can fetch a new drop if we navigate to a different drop's show page
    // debugger
    if (this.props.match.params.dropId !== prevProps.match.params.dropId) {
      this.props.fetchDrop(this.props.match.params.dropId);
    }
  }

  render() {
    return (
      <div>
        <p>{this.props.drop.body}</p>
        <Link to="/">Go Back</Link>
      </div>
    );
  }
}

const msp = (state, ownProps) => {
  // ownProps -> inline props (ie props that did not come from msp or mdp)
  // here, ownProps include history, location, match because this component is being rendered by a Route component in app.jsx
  const dropId = ownProps.match.params.dropId;
  const drop = state.drops[dropId] || {};
  // debugger
  return {
    drop
  };
};

const mdp = (dispatch) => {
  return {
    fetchDrop: (dropId) => dispatch(fetchDrop(dropId))
  };
};

export default connect(msp, mdp)(DropShow);