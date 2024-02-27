/**
 ViewController.m
 InAppMessageFramework
 
 Created by Todd Isaacs on 2/24/24.
 
 The InAppViewController is responsible for creating the presented UI and ensuring the inApp view is correctly setup for all message types.
 
 This class is responsible for handling XYZ and interacts with classes ABC and DEF to accomplish its goals. It is designed to be instantiated by class GHI and provides a delegate interface for callback notifications.

 - Important: Include any important notes about using the class.
 - Note: Additional details that might be helpful for the developer.
 - Warning: Any warnings about misuse of the class.
*/

#import "InAppViewController.h"
#import "InAppMessageViewFactory.h"
#import "InAppFrameworkConstants.h"

@interface InAppViewController ()

@property (nonatomic, strong) UIView *containerView; // Declare the containerView

@end

@implementation InAppViewController

- (instancetype)initWithMessage:(InAppMessage *)message {
    self = [super init];
    if (self) {
        _message = message;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize the containerView and add it to the view controller's view
    self.containerView = [[UIView alloc] init]; // Initialize the containerView
    [self.view addSubview:self.containerView];
    
    // Call setup method to configure containerView based on the message type
    [self setupContainerViewForMessage:self.message];
    
    // Present the in-app message
    [self presentInAppMessage];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        // This will trigger a layout update on the subview InAppMessageView
        [self.containerView layoutIfNeeded];
    } completion:nil];
}

// Add constraints to containerView to fill the entire view controller's view.  Becuase
// these are auto layout constratints the view will container view will be sized correclty
// for all orientations
- (void)setupContainerViewForMessage:(InAppMessage *)message {
    // Create the in-app message view using the factory
    UIView<InAppMessageViewProtocol> *messageView = [InAppMessageViewFactory viewForMessage:self.message];
    
  
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO; // Use auto layout
  
    InAppPresentationStyle style = [messageView presentationStyle];
     NSArray<NSLayoutConstraint *> *constraints = [self constraintsForPresentationStyle:style withContainerView:self.containerView];
  
     [NSLayoutConstraint activateConstraints:constraints];
  
      // Set common constraints for all message types
      [NSLayoutConstraint activateConstraints:@[
          [self.containerView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
          [self.containerView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]
      ]];
      
    // Additional containerView styling
    self.containerView.backgroundColor = [UIColor whiteColor];
    self.containerView.layer.cornerRadius = 10.0;
}

- (void)presentInAppMessage {
    // Create the in-app message view using the factory
    UIView<InAppMessageViewProtocol> *messageView = [InAppMessageViewFactory viewForMessage:self.message];
  
    messageView.translatesAutoresizingMaskIntoConstraints = NO; // Use auto layout
    [self.containerView addSubview:messageView];
    
    // Constraints for messageView to fill given containerView
    [NSLayoutConstraint activateConstraints:@[
        [messageView.topAnchor constraintEqualToAnchor:self.containerView.topAnchor],
        [messageView.bottomAnchor constraintEqualToAnchor:self.containerView.bottomAnchor],
        [messageView.leadingAnchor constraintEqualToAnchor:self.containerView.leadingAnchor],
        [messageView.trailingAnchor constraintEqualToAnchor:self.containerView.trailingAnchor]
    ]];
}

- (NSArray<NSLayoutConstraint *> *)constraintsForPresentationStyle:(InAppPresentationStyle)style withContainerView:(UIView *)containerView {
    switch (style) {
        case FullScreen:
            return @[
                // Constraints to fill the containerView
                [self.containerView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
                [self.containerView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
                [self.containerView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                [self.containerView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
                [self.containerView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
                [self.containerView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]
            ];
        case Modal:
            return @[
                // Constraints for centered modal view
                [self.containerView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
                [self.containerView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
                [self.containerView.widthAnchor constraintEqualToConstant:300], // Fixed width
                [self.containerView.heightAnchor constraintEqualToConstant:400]  // Fixed height
            ];
        case Banner:
            return @[
                // Constraints for banner view
                [self.containerView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
                [self.containerView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                [self.containerView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
                [self.containerView.heightAnchor constraintEqualToConstant:100] // Fixed height for banner
            ];
    }
}

@end

