//
//  InAppMessageViewFactory.h
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "InAppMessage.h"
#import "InAppMessageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface InAppMessageViewFactory : NSObject
 + (InAppMessageView *)viewForMessage:(InAppMessage *)message;
@end

NS_ASSUME_NONNULL_END
