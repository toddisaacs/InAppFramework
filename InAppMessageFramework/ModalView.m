//
//  ModalInAppMessageView.m
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

#import "ModalView.h"
#import "InAppMessage.h"

@implementation ModalView

- (instancetype)initWithMessage:(InAppMessage *)message {
  self = [super initWithMessage:message];
  if (self) {
    // Initialization moved to configureView in the base class
  }
  return self;
}

- (void)configureView {
  
}



@end

