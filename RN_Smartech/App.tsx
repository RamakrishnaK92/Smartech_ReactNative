import React, { useEffect } from 'react';
// import Quiz from './examples/1-quiz-game/App';
// import BookingCar from './examples/2-booking-car/App';
// import GmailClone from './examples/3-gmail-clone/app/App';


import SmartechReact from 'smartech-base-react-native';
// import Smartech from 'smartech-base-react-native';
// import SmartechPushReact from 'smartech-push-react-native';

const SmartechPushReact = require('smartech-push-react-native');

const App:React.FunctionComponent = (props) => {
  // Comment unwanted examples, return the example you want to display

  const updateDeeplink = (deeplink:String) => ({
    type: 'UPDATE_DEEPLINK',
    payload: deeplink,
  });
  // const { navigation } = props;

  // let eventEmitterSubscription;

// const handleDeeplinkWithPayload = (smartechData:any) => {
//   console.log('Deeplink and Payload At JS App Level: ' + JSON.stringify(smartechData));
//   updateDeeplink(smartechData.deeplink);
// };
const handleDeeplinkWithNotificationPayload = (smartechData:any) => {
  console.log('SMTLogg RN Smartech Data :: ', smartechData);
  console.log('SMTLog RN Smartech Deeplink :: ', smartechData.smtDeeplink);
  console.log('SMTLog RN Smartech CustomPayload:: ', smartechData.smtCustomPayload);
};

useEffect(() => {

  SmartechReact.addListener(SmartechReact.SmartechDeeplink, handleDeeplinkWithNotificationPayload);

      // Deeplink callback for Push Notification, InappMessage and AppInbox
  
  // console.log(SmartechReact.SmartechDeeplink)

//  SmartechReact.addListener(SmartechReact.SmartechDeeplink, handleDeeplinkWithNotificationPayload) => {
//   console.log("SMTLogger RN deeplink:", handleDee);
//   console.log('SMTL RN smartech Data ::', smartechData);
//        // Handling the SDK Deeplink Callback.
//        console.log('SMTL RN Deeplink :: ', smartechData.smtDeeplink);

SmartechPushReact.getDeepLinkUrl(function (smartechData:any) {
  console.log('Smartech Data ::', smartechData);
  // Handling the SDK Deeplink Callback.
  console.log('Smartech Deeplink :: ', smartechData.smtDeeplink);
  console.log('Smartech CustomPayload:: ', smartechData.smtCustomPayload);
})
});

 //Remove this listener on cleanup
//  SmartechReact.removeListener(SmartechReact.SmartechDeeplink);



//  export default App;
}