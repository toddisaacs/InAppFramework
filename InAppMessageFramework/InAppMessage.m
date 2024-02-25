//
//  InAppMessage.m
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/24/24.
//

#import "InAppMessage.h"

@implementation InAppMessage

- (instancetype)initWithMessageType:(InAppMessageType)messageType imageName:(NSString *)imageName text:(NSString *)text {
    self = [super init];
    if (self) {
        self.messageType = messageType;
        self.imageName = imageName;
        self.text = text;
    }
    return self;
}

- (instancetype)initWithEventType:(InAppMessageEvent)event messageType:(InAppMessageType)messageType imageName:(NSString *)imageName text:(NSString *)text {
    self = [super init];
    if (self) {
      self.messageType = messageType;
      self.imageName = imageName;
      self.text = text;
      self.eventType = event;
  }
  return self;
}

@end

