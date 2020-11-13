import React from 'react';

export default class DropsIndex extends React.Component {
  constructor(props) {
      super(props);
      // debugger
  }

  componentDidMount() {
    // debugger
    this.props.fetchAllDrops();
    // invoking function defined in mapDispatchToProps
  }

  render() {
    // debugger
    if (this.props.drops.length === 0) {
      return <span>No drops yet!</span>;
    }

    const dropLis = this.props.drops.map(drop => {
      const author = this.props.users[drop.author_id];
      return (
        <li key={drop.id}>
          {drop.body} - {author.username}
        </li>
      )
    });

    return (<ul className="drops-list">{dropLis}</ul>);
  }
}