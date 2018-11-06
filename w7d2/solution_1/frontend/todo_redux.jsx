import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// Phase 1
// function addLoggingToDispatch(store) {
//   const storeDispatch = store.dispatch
//   return (action) => {
//     console.log("Old State:", store.getState());
//     console.log(action);
//     storeDispatch(action);
//     console.log("New State:", store.getState());
//   }
// }

// Phase 2
// const addLoggingToDispatch = store => next => action => {
//   const dispatch = store.dispatch;
//   next.forEach(middleware => )
// }

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  // Phase 1
  // store.dispatch = addLoggingToDispatch(store);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
