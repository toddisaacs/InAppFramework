//
//  InAppMessageViewFactory.m
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

// InAppMessageViewFactory.m
#import "InAppMessageViewFactory.h"
#import "FullScreenView.h" // For Fullscreen
#import "ModalView.h" // For Modal
//#import "BannerView.h" // For Banner

@implementation InAppMessageViewFactory

+ (InAppMessageView *)viewForMessage:(InAppMessage *)message {
    switch (message.messageType) {
        case FullscreenTemplate:
            return [[FullScreenView alloc] initWithMessage:message];
//        case InAppMessageTypeModal:
//            return [[ModalView alloc] initWithMessage:message];
//        case InAppMessageTypeBanner:
//            return [[BannerInAppMessageView alloc] initWithMessage:message];
        default:
            return nil; // Handle unknown types appropriately
    }
}

@end


