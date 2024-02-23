//
//  NotificationService.swift
//  TestNSE
//
//  Created by Ramakrishna Kasuba on 05/05/23.
//

import UserNotifications
import SmartPush

class NotificationService: UNNotificationServiceExtension {
  
  let smartechServiceExtension = SMTNotificationServiceExtension()
  
  override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
    //...
  if SmartPush.sharedInstance().isNotification(fromSmartech:request.content.userInfo){
      smartechServiceExtension.didReceive(request, withContentHandler: contentHandler)
    }
    //...
  }
  
  override func serviceExtensionTimeWillExpire() {
    //...
    smartechServiceExtension.serviceExtensionTimeWillExpire()
    //...
  }
}