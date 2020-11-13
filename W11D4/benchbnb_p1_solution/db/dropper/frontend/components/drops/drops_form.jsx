import React from 'react';

export default class DropForm extends React.Component {

  constructor(props) {
    super(props)
    this.state = { body: "" };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    return (e) => {
      this.setState({ [field]: e.target.value });
    };
  }

  handleSubmit(e) {
    // debugger
    e.preventDefault();
    const drop = this.state;

    this.props.addDrop(this.state);
    this.setState({ body: "" })
  }

  render() {
    // debugger
    return (
      <section className="drop-form-container"> 
        <h2 className="drop-header">Make a new drop!</h2>
        <form className="drop-form" onSubmit={this.handleSubmit}>
          <label htmlFor="drop-body">Body</label>
          <input
            type="text"
            id="drop-body"
            onChange={this.update("body")}
            value={this.state.body}
          />

          <button>Drop it!</button>
        </form>
      </section>
    );
  }
}
