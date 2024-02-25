//
//  InAppMessage.h
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

#import <Foundation/Foundation.h>
#import "InAppFrameworkConstants.h"

NS_ASSUME_NONNULL_BEGIN

@interface InAppMessage : NSObject

@property (nonatomic, assign) InAppMessageEvent event;
@property (nonatomic, assign) InAppMessageType messageType;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) InAppMessageEvent eventType;
@property (nonatomic, strong) NSString *customViewClassName; // New property to hold custom class name

- (instancetype)initWithEventType:(InAppMessageEvent)eventType messageType:(InAppMessageType)messageType imageName:(NSString *)imageName text:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
