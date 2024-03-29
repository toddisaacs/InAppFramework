//
//  AppDelegate.m
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/25/24.
//

#import "AppDelegate.h"
#import "InAppMessageManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  
  InAppMessage *appLoadMessage = [[InAppMessage alloc] initWithEventType:InAppEvent_AppLoad messageType:FullscreenTemplate imageName:@"Nova" text:@"Welcome to the app!"];

  InAppMessage *modalMessage = [[InAppMessage alloc] initWithEventType:InAppEvent_Custom messageType:ModalTemplate imageName:@"Nova" text:@"Welcome to Modal!"];
  
  [[InAppMessageManager sharedManager] registerMessage:appLoadMessage];
  [[InAppMessageManager sharedManager] registerMessage:modalMessage];
  return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
  // Called when a new scene session is being created.
  // Use this method to select a configuration to create the new scene with.
  return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
  // Called when the user discards a scene session.
  // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
  // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
