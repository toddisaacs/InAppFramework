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
    // Default implementation does nothing.
    // Subclasses override this method to customize the view's appearance and layout.
}

@end



