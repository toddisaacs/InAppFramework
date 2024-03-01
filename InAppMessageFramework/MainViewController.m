//
//  MainViewController.m
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

#import "MainViewController.h"
#import "InAppMessageManager.h"
@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // Create and configure the button
    UIButton *launchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [launchButton setTitle:@"Show In-App Message" forState:UIControlStateNormal];
    [launchButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    launchButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:launchButton];
    
  
  UIButton *modalButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [modalButton setTitle:@"Show Modal In-App Message" forState:UIControlStateNormal];
  [modalButton addTarget:self action:@selector(modalButtonClicked) forControlEvents:UIControlEventTouchUpInside];
  modalButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:modalButton];
  
  // Constraints for buttons to be centered and stacked vertically
     [NSLayoutConstraint activateConstraints:@[
         [launchButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
         [launchButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-30], // Offset to move up
         [modalButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
         [modalButton.topAnchor constraintEqualToAnchor:launchButton.bottomAnchor constant:20], // Space between buttons
     ]];
}

- (void)buttonClicked {
  NSLog(@"buttonClicked Trigger App Load Event");
    [[InAppMessageManager sharedManager] triggerEvent:InAppEvent_AppLoad fromViewController:self];
}

- (void)modalButtonClicked {
  NSLog(@"modalButtonClicked Trigger  Event");
    [[InAppMessageManager sharedManager] triggerEvent:InAppEvent_Custom fromViewController:self];
}

@end

