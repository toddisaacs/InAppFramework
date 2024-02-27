//
//  InAppMessageManager.m
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

#import "InAppMessageManager.h"
#import "InAppViewController.h"

@interface InAppMessageManager ()

@property (strong, nonatomic) NSMutableArray<InAppMessage *> *messages;

@end

@implementation InAppMessageManager

+ (instancetype)sharedManager {
    static InAppMessageManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[InAppMessageManager alloc] init];
        sharedInstance.messages = [NSMutableArray array];
    });
    return sharedInstance;
}

- (void)registerMessage:(InAppMessage *)message {
    [self.messages addObject:message];
}

- (void)triggerEvent:(InAppMessageEvent)event fromViewController:(UIViewController *)viewController {
    NSLog(@"InAppMessageManager triggered for event: %@", @(event));
    
    // Filter messages for the event
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(InAppMessage *evaluatedObject, NSDictionary *bindings) {
        return evaluatedObject.eventType == event;
    }];
    NSArray<InAppMessage *> *filteredMessages = [self.messages filteredArrayUsingPredicate:predicate];
    
    // Assuming we only deal with the first relevant message for simplicity
    if (filteredMessages.count > 0) {
        InAppMessage *messageToShow = filteredMessages.firstObject;
        NSLog(@"Message to show: %@", messageToShow.text);
        
        // Defer the creation and presentation of InAppViewController to the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            // Create InAppViewController with the message
            InAppViewController *inAppVC = [[InAppViewController alloc] initWithMessage:messageToShow];
            
          // Configure the modal presentation style based on the message type
          // I think only modal and full are needed but need to look at split screen view controller
          //TODO: Determine OS presentation style and how to provide for Custom
          switch (messageToShow.messageType) {
              case FullscreenTemplate:
                  inAppVC.modalPresentationStyle = UIModalPresentationFullScreen;
                  inAppVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                  break;
              case ModalTemplate:
                  inAppVC.modalPresentationStyle = UIModalPresentationCustom; // Adjust as necessary for your modal style
                  break;
              case BannerTemplate:
                  inAppVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
                  // Additional logic for banner positioning and size would go here
                  break;
              // Handle other message types
          }
          
            // All we do here is present the InAppViewController
            //TODO: configurable callback option
            [viewController presentViewController:inAppVC animated:YES completion:nil];
        });
    }
}

@end


