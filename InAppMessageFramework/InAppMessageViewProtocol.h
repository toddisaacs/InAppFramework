//
//  InAppMessageViewProtocol.h
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

#import <UIKit/UIKit.h>
#import "InAppMessage.h"

#ifndef InAppMessageViewProtocol_h
#define InAppMessageViewProtocol_h

@protocol InAppMessageViewProtocol <NSObject>

- (void)setMessage:(InAppMessage *)message;
- (void)configureView;

@optional
- (InAppPresentationStyle)presentationStyle;

@end

#endif /* InAppMessageViewProtocol_h */
