#import "AppDelegate.h"

#import <Smartech/Smartech.h>
#import <SmartPush/SmartPush.h>
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>
#import "SmartechBaseReactNative.h"
#import "SmartechRCTEventEmitter.h"


#import <React/RCTBundleURLProvider.h>
//#import <React/RCTRootView.h>
//
//#if RCT_NEW_ARCH_ENABLED
//#import <React/CoreModulesPlugins.h>
//#import <React/RCTCxxBridgeDelegate.h>
//#import <React/RCTFabricSurfaceHostingProxyRootView.h>
//#import <React/RCTSurfacePresenter.h>
//#import <React/RCTSurfacePresenterBridgeAdapter.h>
//#import <ReactCommon/RCTTurboModuleManager.h>
//
//#import <react/config/ReactNativeConfig.h>
//
//
//
//static NSString *const kRNConcurrentRoot = @"concurrentRoot";
//
//@interface AppDelegate () <SmartechDelegate, RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate, UNUserNotificationCenterDelegate> {
//  
//  
//  RCTTurboModuleManager *_turboModuleManager;
//  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
//  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
//  facebook::react::ContextContainer::Shared _contextContainer;
// 
//      
//}
//@end
//#endif

@interface AppDelegate () <SmartechDelegate, UNUserNotificationCenterDelegate> {
  
  
}
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  //  RCTAppSetupPrepareApp(application);
  
  //
  //  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
  //
  //#if RCT_NEW_ARCH_ENABLED
  //  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  //  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  //  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  //  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  //  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
  //#endif
  
  //  NSDictionary *initProps = [self prepareInitialProps];
  //  UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"ReactNativeTypeScriptExamples", initProps);
  //
  self.moduleName = @"ReactNativeTypeScript";
  self.initialProps = @{};

  //  if (@available(iOS 13.0, *)) {
  //    rootView.backgroundColor = [UIColor systemBackgroundColor];
  //  } else {
  //    rootView.backgroundColor = [UIColor whiteColor];
  //  }
  
  [[Smartech sharedInstance] initSDKWithDelegate: self withLaunchOptions:launchOptions];
  [[SmartPush sharedInstance] registerForPushNotificationWithDefaultAuthorizationOptions];
  [[Smartech sharedInstance] setDebugLevel:SMTLogLevelVerbose];
  [UNUserNotificationCenter currentNotificationCenter].delegate = self;
  
  
  
  //  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  //  UIViewController *rootViewController = [UIViewController new];
  //  rootViewController.view = rootView;
  //  self.window.rootViewController = rootViewController;
  //  [self.window makeKeyAndVisible];
  //
  
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

///// This method controls whether the `concurrentRoot`feature of React18 is turned on or off.
/////
///// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
///// @note: This requires to be rendering on Fabric (i.e. on the New Architecture).
///// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it returns `false`.
//- (BOOL)concurrentRootEnabled
//{
//  // Switch this bool to turn on and off the concurrent root
//  return true;
//}

//- (NSDictionary *)prepareInitialProps
//{
//  NSMutableDictionary *initProps = [NSMutableDictionary new];
//
//#ifdef RCT_NEW_ARCH_ENABLED
//  initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
//#endif
//
//  return initProps;
//}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  
  
  return [self bundleURL];

}

- (NSURL *)bundleURL
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
  
#endif
}


//#if RCT_NEW_ARCH_ENABLED
//
//#pragma mark - RCTCxxBridgeDelegate
//
//- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
//{
//  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
//                                                             delegate:self
//                                                            jsInvoker:bridge.jsCallInvoker];
//  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
//}
//
//#pragma mark RCTTurboModuleManagerDelegate
//
//- (Class)getModuleClassFromName:(const char *)name
//{
//  return RCTCoreModulesClassProvider(name);
//}
//
//- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
//                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
//{
//  return nullptr;
//}
//
//- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
//                                                     initParams:
//                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
//{
//  return nullptr;
//}
//
//- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
//{
//  return RCTAppSetupDefaultModuleFromClass(moduleClass);
//}
//
//#endif

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
  [[SmartPush sharedInstance] didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
  [[SmartPush sharedInstance] didFailToRegisterForRemoteNotificationsWithError:error];
}

#pragma mark - UNUserNotificationCenterDelegate Methods
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
  [[SmartPush sharedInstance] willPresentForegroundNotification:notification];
  completionHandler(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
  [[SmartPush sharedInstance] didReceiveNotificationResponse:response];
  completionHandler();
}


#pragma mark Smartech Deeplink Delegate


- (void)handleDeeplinkActionWithURLString:(NSString *)deeplinkURLString andNotificationPayload:(NSDictionary *)notificationPayload {
  NSMutableDictionary *smtData = [[NSMutableDictionary alloc] initWithDictionary:notificationPayload];
  smtData[kDeeplinkIdentifier] = smtData[kSMTDeeplinkIdentifier];
  smtData[kCustomPayloadIdentifier] = smtData[kSMTCustomPayloadIdentifier];
  

  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5* NSEC_PER_SEC), dispatch_get_main_queue(), ^{

  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5* NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    NSLog(@"SMTLOGGER DEEPLINK: %@",deeplinkURLString);
    [[NSNotificationCenter defaultCenter] postNotificationName:kSMTDeeplinkNotificationIdentifier object:nil userInfo:smtData];
  });
 
}



@end
//#endif
