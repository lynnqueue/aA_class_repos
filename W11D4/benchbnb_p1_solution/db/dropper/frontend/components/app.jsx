import React from 'react';
import { Provider } from 'react-redux';
import { HashRouter, Route, Switch } from 'react-router-dom';
import DropFormContainer from './drops/drops_form_container';
import DropsIndexContainer from './drops/drops_index_container';
import DropShow from './drops/drop_show';

export default ({ store }) => {
  // debugger
  return(
    <HashRouter>
      <Provider store={store}>
        <main>
          <div className="logo">
            <img src="assets/dropper-logo.png" alt="dropper-logo" />
            <h1>DROPPER</h1>
            <img src="assets/dropper-logo.png" alt="dropper-logo" />
          </div>
          <Switch>
            <Route path="/drops/:dropId" component={DropShow} />
            <Route path="/" exact component={DropsIndexContainer} />
          </Switch>
          <DropFormContainer banana="banana" apple="apple" />
        </main>
      </Provider>
    </HashRouter>
  )
}

// Note:inline props banana & apple for DropFormContainer component were just a demo to show off ownProps in msp in DropFormContainer