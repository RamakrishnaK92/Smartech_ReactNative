import React, { useEffect } from 'react';
import Quiz from './examples/1-quiz-game/App';
import BookingCar from './examples/2-booking-car/App';
import GmailClone from './examples/3-gmail-clone/app/App';

// import Smartech from 'smartech-base-react-native';
// import SmartechPushReact from 'smartech-push-react-native';

const SmartechPushReact = require('smartech-push-react-native');

const App: React.FunctionComponent = (props) => {
  // Comment unwanted examples, return the example you want to display

  const updateDeeplink = (deeplink:String) => ({
    type: 'UPDATE_DEEPLINK',
    payload: deeplink,
  });
  // const { navigation } = props;

  let eventEmitterSubscription;

const handleDeeplinkWithPayload = (smartechData:any) => {
  console.log('Deeplink and Payload At JS App Level: ' + JSON.stringify(smartechData));
  updateDeeplink(smartechData.deeplink);
};

//NEW METHOD


// OLD METHODS
  // useEffect(() => {

  //   console.log('in ussefect');
  //   //================= SMARTECH SDK IMPLEMENTATION START ================= 

  //   // Adding the Smartech Deeplink Notification Listener
  //    SmartechPushReact.addDeepLinkListener(SmartechPushReact.SmartechDeeplinkNotification, handleDeeplinkWithPayload, (eventSubscriptionObject) => {
  //     eventEmitterSubscription = eventSubscriptionObject;
  //   });

  //   // Android callback to handle deeplink in terminated/background state.
  //   SmartechPushReact.getDeepLinkUrl(function (_response) {
  //     console.log('getDeepLinkUrl Initial Deeplink Response ', _response);
  //     props.updateDeeplink(_response.deeplink);
  //   });

  //   // return function cleanup() {
  //   //   // eventEmitterSubscription.remove()
     
  //   //   // Removing the Smartech Deeplink Notification Listener
  //   //   //SmartechPushReact.removeListener(SmartechPushReact.SmartechDeeplinkNotification, handleDeeplinkWithPayload);
  //   // };
  // }, []);

  console.log('TEST !@# and Payload At JS App Level: ');
  return <Quiz />;
  return <BookingCar />;
  return <GmailClone />;


};











// // Android callback to handle deeplink in terminated/background state.
// SmartechPushReact.getDeepLinkUrl(function (_response) {
//   console.log('getDeepLinkUrl Initial Deeplink Response ', _response);
//   props.updateDeeplink(_response.deeplink);
// });
// eventEmitterSubscription.remove() // For remove listner
// const handleDeeplinkWithPayload = (deeplinkdata) => {  };


export default App;
