//
//  MainViewController.m
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

// MainViewController.m
#import "MainViewController.h"
#import "InAppMessageManager.h"
@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Create and configure the button
    UIButton *launchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [launchButton setTitle:@"Show In-App Message" forState:UIControlStateNormal];
    [launchButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    launchButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:launchButton];
    
    // Center the button in the view
    [NSLayoutConstraint activateConstraints:@[
        [launchButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [launchButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
    ]];
}

- (void)buttonClicked {
  NSLog(@"buttonClicked Trigger App Load Event");
    [[InAppMessageManager sharedManager] triggerEvent:InAppEvent_AppLoad fromViewController:self];
}

@end

