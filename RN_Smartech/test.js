import { useEffect } from 'react';
import { NativeModules } from 'react-native';

const
//@ts-ignore
useEffect (() => {

    NativeModules.HanselConfigs.getString("testRNconfig", withDefaultValue: "Test");

});