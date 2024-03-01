//
//  ModalInAppMessageView.m
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

#import "ModalView.h"
#import "InAppMessage.h"

@interface ModalView ()

@property (nonatomic, strong) NSArray *portraitConstraints;
@property (nonatomic, strong) NSArray *landscapeConstraints;

@end

@implementation ModalView

- (instancetype)initWithMessage:(InAppMessage *)message {
  self = [super initWithMessage:message];
  if (self) {
    // Initialization moved to configureView in the base class
  }
  return self;
}

- (void)configureView {
  [super configureView];
    // Ensure to call super to inherit any base class setup
    [super configureView];
    
    // Initialize and set up the imageView and label
    [self setupImageView];
    [self setupLabel];
    [self decorateMessage];
  
    // Prepare constraints for both orientations
    [self prepareConstraints];
  
    [self addCloseButton];
}

- (InAppViewDisplayType)displayType {
    return Modal;
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
      [self.imageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
      [self.imageView.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:0.5],
      
      [self.label.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor],
      [self.label.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
      [self.label.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
      [self.label.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ];
    
    // Initially set constraints for current orientation
    [self updateConstraintsForCurrentOrientation];
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

