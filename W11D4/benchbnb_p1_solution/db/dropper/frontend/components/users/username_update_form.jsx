import React from 'react'
import { connect } from 'react-redux';
import { updateUser } from "../../actions/user_actions";

class UsernameUpdateForm extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            username: this.props.user.username
        };
        this.handleChange = this.handleChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }
    handleChange(e) {
        this.setState({ username: e.currentTarget.value });
    }
    handleSubmit(e) {
        e.preventDefault();
        this.props.updateUser({
            id: this.props.user.id,
            username: this.state.username
        });
    }
    
    render() {
        return (
            <form onSubmit={this.handleSubmit}>
                <input
                    type="text"
                    onChange={this.handleChange}
                    value={this.state.username}
                />
                <input type="submit" value="Update Username" />
            </form>
        );
    }
}

const mapDispatchToProps = dispatch => {
    return {
        updateUser: user => dispatch(updateUser(user))
    };
};
export default connect(
    null,
    mapDispatchToProps
)(UsernameUpdateForm);
