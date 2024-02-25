//
//  InAppMessageView.h
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/25/24.
//

#import <UIKit/UIKit.h>
#import "InAppMessage.h"
#import "InAppMessageViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface InAppMessageView : UIView <InAppMessageViewProtocol>

@property (nonatomic, strong, nullable) InAppMessage *message;

- (instancetype)initWithMessage:(InAppMessage *)message NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithFrame:(CGRect)frame NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)coder NS_DESIGNATED_INITIALIZER;

// InAppMessageView is responsible for laying itself out within the container it's given. Each
// view will implement configureView and will layout its subviews. 
- (void)configureView;

@end

NS_ASSUME_NONNULL_END
