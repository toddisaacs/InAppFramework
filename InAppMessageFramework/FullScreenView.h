//
//  FullscreenView.h
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

#import "InAppMessageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FullScreenView : InAppMessageView

@property (strong, nonatomic) UIImageView *imageView; 
@property (strong, nonatomic) UILabel *label;

@end

NS_ASSUME_NONNULL_END
