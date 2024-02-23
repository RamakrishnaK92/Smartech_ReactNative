//
//  NotificationManager.m
//  ReactNativeTypeScriptExamples
//
//  Created by Ramakrishna Kasuba on 04/05/23.
//

#import <Foundation/Foundation.h>

//NotificationManager.m file
#import "NotificationManager.h"

@implementation NotificationManager

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(postNotification:(NSString *)name) {
  [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil userInfo:nil];
}

@end
