//
//  InAppMessageManager.h
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "InAppMessage.h"

NS_ASSUME_NONNULL_BEGIN

@interface InAppMessageManager : NSObject

+ (instancetype)sharedManager;

- (void)registerMessage:(InAppMessage *)message;
- (void)triggerEvent:(InAppMessageEvent)event fromViewController:(UIViewController *)viewController;

@end


NS_ASSUME_NONNULL_END
