//
//  InAppMessageView.m
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/25/24.
//

#import "InAppMessageView.h"

@implementation InAppMessageView

- (instancetype)initWithMessage:(InAppMessage *)message {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _message = message;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    return self;
}

- (void)setMessage:(InAppMessage *)message {
    _message = message;
    [self configureView]; // Reconfigure the view when a new message is set
}

//
- (void)configureView {
// subviews to implement
}

- (void)addCloseButton {
  UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
  UIFont *size = [UIFont systemFontOfSize: 60];
  UIImageSymbolConfiguration *config = [UIImageSymbolConfiguration configurationWithFont:size];
  [config traitCollection: colot]
  
    // Create a symbol configuration with desired point size and weight
    UIImageSymbolConfiguration *sizeConfig = [UIImageSymbolConfiguration configurationWithPointSize:30 weight:UIImageSymbolWeightRegular];
   
    
    // Load the symbol image
    UIImage *buttonImage = [UIImage systemImageNamed:@"xmark.circle.fill"];

   [buttonImage imageWithTintColor:[UIColor blueColor] renderingMode:UIImageRenderingModeAlwaysOriginal];

    // Apply the configuration and set the tint color
  
    //[closeButton setPreferredSymbolConfiguration:config forImageInState:UIControlStateNormal];
    [closeButton setImage:buttonImage forState:UIControlStateNormal];
    //closeButton.tintColor = [UIColor blueColor]; // Set your custom color here
    
    closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:closeButton];
    
    // Constraints for the close button
    [NSLayoutConstraint activateConstraints:@[
        [closeButton.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:20],
        [closeButton.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-20],
        [closeButton.widthAnchor constraintEqualToConstant:44],
        [closeButton.heightAnchor constraintEqualToConstant:44]
    ]];
    
    [closeButton addTarget:self action:@selector(closeButtonTapped) forControlEvents:UIControlEventTouchUpInside];
}


- (void)closeButtonTapped {
    NSLog(@"Close button tapped");
    [self.delegate shouldDismissInAppMessageView];
}

@end



