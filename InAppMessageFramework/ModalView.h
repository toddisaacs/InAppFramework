//
//  ModalInAppMessageView.h
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

#import "InAppMessageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModalView : InAppMessageView

@property (strong, nonatomic) UIImageView *imageView; // Specific to ModalView
@property (strong, nonatomic) UILabel *label; // Specific to ModalView

@end

NS_ASSUME_NONNULL_END
