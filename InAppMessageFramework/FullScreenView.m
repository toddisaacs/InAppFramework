//
//  FullscreenView.m
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

#import "FullScreenView.h"
#import "InAppMessage.h"

@interface FullScreenView ()
@property (nonatomic, strong) NSArray *portraitConstraints;
@property (nonatomic, strong) NSArray *landscapeConstraints;
@end

@implementation FullScreenView

// View configuration will be called after the view controller sizes the container this view will be
// presented in.
- (instancetype)initWithMessage:(InAppMessage *)message {
    self = [super initWithMessage:message];
    return self;
}

- (void)configureView {
    // Ensure to call super to inherit any base class setup
    [super configureView];
    
    // Initialize and set up the imageView and label
    [self setupImageView];
    [self setupLabel];
    [self decorateMessage];
  
    // Prepare constraints for both orientations
    [self prepareConstraints];
}

- (InAppViewDisplayType)displayType {
    return FullScreen;
}

- (void)setupImageView {
    if (!self.imageView) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds = YES;
        self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.imageView];
    }
}

- (void)setupLabel {
    if (!self.label) {
        self.label = [[UILabel alloc] init];
        self.label.numberOfLines = 0;
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.label];
    };
}

- (void)decorateMessage {
  
    // Use the message data to configure the image and label
      if (self.message) {
          UIImage *image = [UIImage imageNamed:self.message.imageName];
          if (!image) {
              NSLog(@"Failed to load image named %@", self.message.imageName);
          }
          self.imageView.image = image;
          self.label.text = self.message.text;
      } else {
          NSLog(@"The message is nil, cannot configure the view");
      }
}

- (void)prepareConstraints {
    // Portrait constraints
    self.portraitConstraints = @[
        [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.imageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.imageView.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:0.5],
        
        [self.label.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor],
        [self.label.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.label.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.label.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ];
    
    // Landscape constraints
    self.landscapeConstraints = @[
        [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
        [self.imageView.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.5],
        
        [self.label.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.label.leadingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor],
        [self.label.trailingAnchor constraintEqualToAnchor:self.trailingAnchor]
    ];
    
    // Initially set constraints for current orientation
    [self updateConstraintsForCurrentOrientation];
}

- (void)updateConstraintsForCurrentOrientation {
    // Deactivate all constraints first
    [NSLayoutConstraint deactivateConstraints:self.portraitConstraints];
    [NSLayoutConstraint deactivateConstraints:self.landscapeConstraints];
    
    // Check current orientation and activate constraints accordingly
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
        [NSLayoutConstraint activateConstraints:self.landscapeConstraints];
    } else {
        [NSLayoutConstraint activateConstraints:self.portraitConstraints];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateConstraintsForCurrentOrientation];
}

@end


