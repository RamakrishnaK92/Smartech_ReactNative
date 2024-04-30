import React, { useEffect } from 'react';
// import Quiz from './examples/1-quiz-game/App';
// import BookingCar from './examples/2-booking-car/App';
// import GmailClone from './examples/3-gmail-clone/app/App';
import SmartechReact from 'smartech-base-react-native';


const App: React.FunctionComponent = (props) => {
  // Comment unwanted examples, return the example you want to display


  const handleDeeplinkWithNotificationPayload = (smartechData:any) => {
    console.log('SMTLogger RN Smartech Data :: ', smartechData);
    console.log('SMTLogger RN Smartech Deeplink :: ', smartechData.smtDeeplink);
    console.log('SMTLogger RN Smartech CustomPayload:: ', smartechData.smtCustomPayload);
  };
useEffect(() => {
//@ts-ignore
 SmartechReact.addListener(SmartechReact.SmartechDeeplink,handleDeeplinkWithNotificationPayload)
  console.log(SmartechReact.SmartechDeeplink)

  
 //Remove this listener on cleanup
 //  SmartechReact.removeListener(SmartechReact.SmartechDeeplink);
})
};
export default App;