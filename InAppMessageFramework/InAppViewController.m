/**
 ViewController.m
 InAppMessageFramework
 
 Created by Todd Isaacs on 2/24/24.
 
 The InAppViewController is responsible for creating the presented UI and ensuring the inApp view is correctly setup for all message types.
 
 InApp ViewController lifecycle
 -- initialize view controller with message defintion InAppMessage
 -- viewDidLoad is called when InAppMessageManger presents this viewController
 -- create containerView used to hold the InAppMessage.
 -- setup containerView, applies constraints to size and postion based on message presentation style
 -- present InAppMessageView add InAppMessageView to containerView, call configure on InAppMessage
*/

#import "InAppViewController.h"
#import "InAppMessageViewFactory.h"
#import "InAppFrameworkConstants.h"

@interface InAppViewController () <InAppMessageViewDelegate>

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) InAppMessageView *messageView;

@end

@implementation InAppViewController

- (instancetype)initWithMessage:(InAppMessage *)message {
    self = [super init];
    if (self) {
        _message = message;
        _messageView = [InAppMessageViewFactory viewForMessage:self.message];
        _messageView.delegate = self;
    }
    return self;
}

// Called when view controller presnted
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize the containerView and add it to the view controller's view
    self.containerView = [[UIView alloc] init]; // Initialize the containerView
    [self.view addSubview:self.containerView];
    
    // Call setup method to configure containerView based on the message type.  This sets the
    // correct presentation style and size based on the InApp message
    [self setupContainerViewForMessage];
    
    // Present the in-app message in the properly sized and postioned containerView
    [self presentInAppMessage];
}

// This will trigger a layout update on the subview InAppMessageView
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        // This will trigger sub view layout
        [self.containerView layoutIfNeeded];
    } completion:nil];
}

// Add constraints to containerView to fill the entire view controller's view.  Becuase
// these are auto layout constratints the view will container view will be sized correclty
// for all orientations
- (void)setupContainerViewForMessage {
    
  // Create the in-app message view using the factory, may need to move this earlier in life cycle
  //UIView<InAppMessageViewProtocol> *messageView = [InAppMessageViewFactory viewForMessage:self.message];
  
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO; // Use auto layout
  
    InAppViewDisplayType displayType = [self.messageView displayType];
     NSArray<NSLayoutConstraint *> *constraints = [self constraintsForPresentationStyle:displayType withContainerView:self.containerView];
  
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
  //InAppMessageView *messageView = [InAppMessageViewFactory viewForMessage:self.message];
  
    _messageView.translatesAutoresizingMaskIntoConstraints = NO; // Use auto layout
    [self.containerView addSubview:self.messageView];
    
    // Constraints for messageView to fill all the given containerView which was sized and positioned
    // in setupContainerViewForMessage() based on message definition
    [NSLayoutConstraint activateConstraints:@[
        [self.messageView.topAnchor constraintEqualToAnchor:self.containerView.topAnchor],
        [self.messageView.bottomAnchor constraintEqualToAnchor:self.containerView.bottomAnchor],
        [self.messageView.leadingAnchor constraintEqualToAnchor:self.containerView.leadingAnchor],
        [self.messageView.trailingAnchor constraintEqualToAnchor:self.containerView.trailingAnchor]
    ]];
  
  //InAppMessageView now knows its size and we can tell it to configure its view
  [self.messageView configureView];
}

- (NSArray<NSLayoutConstraint *> *)constraintsForPresentationStyle:(InAppViewDisplayType)displayType withContainerView:(UIView *)containerView {
    switch (displayType) {
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
                //TODO: Determine how to size, will it be based on percentage of screen
                [self.containerView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
                [self.containerView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
                [self.containerView.widthAnchor constraintEqualToConstant:300], // Fixed width
                [self.containerView.heightAnchor constraintEqualToConstant:400]  // Fixed height
            ];
        case Banner:
            return @[
                // Constraints for banner view
                //TODO: determine sizing options
                [self.containerView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
                [self.containerView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                [self.containerView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
                [self.containerView.heightAnchor constraintEqualToConstant:100] // Fixed height for banner
            ];
    }
}

- (void)shouldDismissInAppMessageView {
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end

