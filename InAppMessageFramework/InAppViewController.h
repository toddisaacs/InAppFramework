//
//  ViewController.h
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

#import <UIKit/UIKit.h>
#import "InAppMessage.h"

@interface InAppViewController : UIViewController

@property (strong, nonatomic) InAppMessage *message;

- (instancetype)initWithMessage:(InAppMessage *)message;

@end


